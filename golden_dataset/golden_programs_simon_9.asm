; DESCRIPTION: The GeOS assembly code implements a Simon Says memory game with four colored buttons arranged in a cross pattern. The game displays a sequence of colors and requires the player to repeat it by clicking the corresponding buttons; each correct round extends the sequence, while a wrong click ends the game.

; simon.asm -- Simon Says Memory Game for Geometry OS
;
; Proves: BEEP (audio tones), RAND (sequence generation), HITSET/HITQ,
;         FRAME loop, RECTF (colored buttons), TEXT (score display).
;
; Controls:
;   Watch the color sequence, then repeat it by clicking buttons
;   Sequence grows by one each round
;   Wrong click = game over
;
; Layout:
;   4 colored buttons in a cross pattern
;   Red (top), Green (left), Blue (right), Yellow (bottom)
;   Score display at top
;
; NOTE: No colons in comments (assembler pitfall)

#define RED_BTN    0
#define GREEN_BTN  1
#define BLUE_BTN   2
#define YELLOW_BTN 3

; RAM Layout (safely above bytecode):
#define SEQUENCE   0x4000   ; sequence buffer (64 entries max)
#define SEQ_LEN    0x4200   ; current sequence length
#define SHOW_IDX   0x4204   ; current show index (during playback)
#define PHASE      0x4208   ; 0=idle, 1=showing, 2=input
#define INPUT_IDX  0x420C   ; current input index
#define SCORE      0x4210   ; player score
#define TIMER      0x4214   ; frame counter for timing
#define STR_BUF    0x4300   ; string buffer
#define SCRATCH    0x4400   ; scratch area

; Button positions (cross pattern)
; Red:    (88, 30, 80, 80)
; Green:  (20, 130, 80, 80)
; Blue:   (156, 130, 80, 80)
; Yellow: (88, 230, 80, 80)

; ── INIT ──────────────────────────────────────
start:
    LDI r15, 1
    LDI r30, 0xFD00

    ; Initialize game
    LDI r20, SEQ_LEN
    LDI r11, 1
    STORE r20, r11
    LDI r20, PHASE
    STORE r20, r11
    LDI r20, INPUT_IDX
    STORE r20, r11
    LDI r20, SCORE
    STORE r20, r11
    LDI r20, TIMER
    STORE r20, r11

    ; Generate first sequence entry
    RAND r20
    LDI r21, 4
    MOD r20, r21
    LDI r21, SEQUENCE
    STORE r21, r20

    ; Start in showing phase
    LDI r20, SHOW_IDX
    LDI r11, 0
    STORE r20, r11
    LDI r20, PHASE
    LDI r11, 1
    STORE r20, r11
    LDI r20, TIMER
    LDI r11, 0
    STORE r20, r11

; ── MAIN LOOP ──────────────────────────────────
main_loop:
    ; Dark background
    LDI r8, 0x111122
    FILL r8

    ; Title
    LDI r20, STR_BUF
    STRO r20, "SIMON SAYS"
    LDI r15, 72
    LDI r9, 6
    LDI r0, STR_BUF
    TEXT r15, r9, r0

    ; Score
    LDI r20, SCORE
    LOAD r20, r20
    LDI r8, 48
    ADD r8, r20
    LDI r21, SCRATCH
    STORE r21, r8
    LDI r8, 0
    LDI r15, 1
    ADD r21, r15
    STORE r21, r8
    LDI r20, STR_BUF
    STRO r20, "Score:"
    LDI r15, 8
    LDI r9, 214
    LDI r0, STR_BUF
    TEXT r15, r9, r0
    LDI r15, 56
    LDI r9, 214
    LDI r0, SCRATCH
    TEXT r15, r9, r0

    ; Round display
    LDI r20, SEQ_LEN
    LOAD r20, r20
    LDI r8, 48
    ADD r8, r20
    LDI r21, SCRATCH
    STORE r21, r8
    LDI r8, 0
    LDI r15, 1
    ADD r21, r15
    STORE r21, r8
    LDI r20, STR_BUF
    STRO r20, "Round:"
    LDI r15, 160
    LDI r9, 214
    LDI r0, STR_BUF
    TEXT r15, r9, r0
    LDI r15, 210
    LDI r9, 214
    LDI r0, SCRATCH
    TEXT r15, r9, r0

    ; Draw 4 buttons (dim colors normally)
    ; Red button (top)
    LDI r15, 88
    LDI r9, 30
    LDI r0, 80
    LDI r2, 80
    LDI r8, 0x440000
    RECTF r15, r9, r0, r2, r8

    ; Green button (left)
    LDI r15, 20
    LDI r9, 130
    LDI r0, 80
    LDI r2, 80
    LDI r8, 0x004400
    RECTF r15, r9, r0, r2, r8

    ; Blue button (right)
    LDI r15, 156
    LDI r9, 130
    LDI r0, 80
    LDI r2, 80
    LDI r8, 0x000044
    RECTF r15, r9, r0, r2, r8

    ; Yellow button (bottom)
    LDI r15, 88
    LDI r9, 230
    LDI r0, 80
    LDI r2, 80
    LDI r8, 0x444400
    RECTF r15, r9, r0, r2, r8

    ; Highlight active button during showing phase
    LDI r20, PHASE
    LOAD r20, r20
    CMPI r20, 1
    JNZ r11, do_input_phase

    ; Showing phase - highlight the current sequence entry
    LDI r20, TIMER
    LOAD r20, r20
    ; Flash on for 15 frames, off for 10 frames = 25 frame cycle
    LDI r21, 25
    MOD r20, r21
    CMPI r20, 15
    BGE r11, do_show_off

    ; Flash on - get current sequence entry
    LDI r20, SHOW_IDX
    LOAD r20, r20
    LDI r21, SEQUENCE
    ADD r21, r20
    LOAD r20, r21
    ; Highlight based on button index
    CMPI r20, RED_BTN
    JNZ r11, check_green_show
    ; Highlight red
    LDI r15, 88
    LDI r9, 30
    LDI r0, 80
    LDI r2, 80
    LDI r8, 0xFF0000
    RECTF r15, r9, r0, r2, r8
    BEEP r15, r9
    JMP do_show_done
check_green_show:
    CMPI r20, GREEN_BTN
    JNZ r11, check_blue_show
    LDI r15, 20
    LDI r9, 130
    LDI r0, 80
    LDI r2, 80
    LDI r8, 0x00FF00
    RECTF r15, r9, r0, r2, r8
    BEEP r15, r9
    JMP do_show_done
check_blue_show:
    CMPI r20, BLUE_BTN
    JNZ r11, check_yellow_show
    LDI r15, 156
    LDI r9, 130
    LDI r0, 80
    LDI r2, 80
    LDI r8, 0x0000FF
    RECTF r15, r9, r0, r2, r8
    BEEP r15, r9
    JMP do_show_done
check_yellow_show:
    LDI r15, 88
    LDI r9, 230
    LDI r0, 80
    LDI r2, 80
    LDI r8, 0xFFFF00
    RECTF r15, r9, r0, r2, r8
    BEEP r15, r9
    JMP do_show_done

do_show_off:
do_show_done:
    ; Advance timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r15, 1
    ADD r21, r15
    STORE r20, r21
    ; Check if we need to move to next show entry
    LDI r20, TIMER
    LOAD r20, r20
    LDI r21, 25
    MOD r20, r21
    CMPI r20, 0
    JNZ r11, do_show_frame
    ; Timer hit cycle boundary - advance show index
    LDI r20, SHOW_IDX
    LOAD r21, r20
    LDI r15, 1
    ADD r21, r15
    STORE r20, r21
    ; Check if showing complete
    LDI r20, SHOW_IDX
    LOAD r20, r20
    LDI r21, SEQ_LEN
    LOAD r21, r21
    CMP r20, r21
    BLT r11, do_show_frame
    ; Showing complete - switch to input phase
    LDI r20, PHASE
    LDI r11, 2
    STORE r20, r11
    LDI r20, INPUT_IDX
    LDI r11, 0
    STORE r20, r11
    LDI r20, TIMER
    LDI r11, 0
    STORE r20, r11
    JMP register_hits

do_input_phase:
    ; Check for game over display
    LDI r20, PHASE
    LOAD r20, r20
    CMPI r20, 3
    JNZ r11, register_hits
    ; Game over - show message
    LDI r20, STR_BUF
    STRO r20, "GAME OVER"
    LDI r15, 78
    LDI r9, 230
    LDI r0, STR_BUF
    TEXT r15, r9, r0

do_show_frame:
register_hits:
    ; Register hit regions for 4 buttons
    LDI r15, 1
    ; Red
    LDI r8, 88
    LDI r12, 30
    LDI r5, 80
    LDI r14, 80
    HITSET r8, r12, r5, r14, 1
    ; Green
    LDI r8, 20
    LDI r12, 130
    LDI r5, 80
    LDI r14, 80
    HITSET r8, r12, r5, r14, 2
    ; Blue
    LDI r8, 156
    LDI r12, 130
    LDI r5, 80
    LDI r14, 80
    HITSET r8, r12, r5, r14, 3
    ; Yellow
    LDI r8, 88
    LDI r12, 230
    LDI r5, 80
    LDI r14, 80
    HITSET r8, r12, r5, r14, 4

    FRAME

    ; Only process input during input phase
    LDI r20, PHASE
    LOAD r20, r20
    CMPI r20, 2
    JNZ r11, main_loop

    HITQ r10
    CMPI r10, 0
    JZ r11, main_loop

    ; Player clicked a button - check against sequence
    LDI r20, INPUT_IDX
    LOAD r20, r20
    LDI r21, SEQUENCE
    ADD r21, r20
    LOAD r21, r21
    ; r10 = clicked button (1-4), r21 = expected (0-3)
    ; Convert click id to button index: id - 1
    MOV r22, r10
    LDI r15, 1
    SUB r22, r15
    ; Compare
    CMP r22, r21
    JZ r11, correct_click

    ; Wrong click - game over
    LDI r20, PHASE
    LDI r11, 3
    STORE r20, r11
    JMP main_loop

correct_click:
    ; Advance input index
    LDI r20, INPUT_IDX
    LOAD r21, r20
    LDI r15, 1
    ADD r21, r15
    STORE r20, r21
    ; Check if all inputs correct
    LDI r20, INPUT_IDX
    LOAD r20, r20
    LDI r21, SEQ_LEN
    LOAD r21, r21
    CMP r20, r21
    BLT r11, main_loop

    ; Round complete! Add score and extend sequence
    LDI r20, SCORE
    LOAD r21, r20
    LDI r15, 1
    ADD r21, r15
    STORE r20, r21

    ; Extend sequence
    LDI r20, SEQ_LEN
    LOAD r21, r20
    LDI r15, 1
    ADD r21, r15
    STORE r20, r21

    ; Generate new random entry at end of sequence
    RAND r20
    LDI r21, 4
    MOD r20, r21
    LDI r21, SEQ_LEN
    LOAD r22, r21
    LDI r15, 1
    SUB r22, r15
    LDI r23, SEQUENCE
    ADD r23, r22
    STORE r23, r20

    ; Start showing phase again
    LDI r20, SHOW_IDX
    LDI r11, 0
    STORE r20, r11
    LDI r20, PHASE
    LDI r11, 1
    STORE r20, r11
    LDI r20, TIMER
    LDI r11, 0
    STORE r20, r11

    JMP main_loop

    HALT
