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
    LDI r3, 1
    LDI r30, 0xFD00

    ; Initialize game
    LDI r20, SEQ_LEN
    LDI r15, 1
    STORE r20, r15
    LDI r20, PHASE
    STORE r20, r15
    LDI r20, INPUT_IDX
    STORE r20, r15
    LDI r20, SCORE
    STORE r20, r15
    LDI r20, TIMER
    STORE r20, r15

    ; Generate first sequence entry
    RAND r20
    LDI r21, 4
    MOD r20, r21
    LDI r21, SEQUENCE
    STORE r21, r20

    ; Start in showing phase
    LDI r20, SHOW_IDX
    LDI r15, 0
    STORE r20, r15
    LDI r20, PHASE
    LDI r15, 1
    STORE r20, r15
    LDI r20, TIMER
    LDI r15, 0
    STORE r20, r15

; ── MAIN LOOP ──────────────────────────────────
main_loop:
    ; Dark background
    LDI r6, 0x111122
    FILL r6

    ; Title
    LDI r20, STR_BUF
    STRO r20, "SIMON SAYS"
    LDI r3, 72
    LDI r5, 6
    LDI r1, STR_BUF
    TEXT r3, r5, r1

    ; Score
    LDI r20, SCORE
    LOAD r20, r20
    LDI r6, 48
    ADD r6, r20
    LDI r21, SCRATCH
    STORE r21, r6
    LDI r6, 0
    LDI r3, 1
    ADD r21, r3
    STORE r21, r6
    LDI r20, STR_BUF
    STRO r20, "Score:"
    LDI r3, 8
    LDI r5, 214
    LDI r1, STR_BUF
    TEXT r3, r5, r1
    LDI r3, 56
    LDI r5, 214
    LDI r1, SCRATCH
    TEXT r3, r5, r1

    ; Round display
    LDI r20, SEQ_LEN
    LOAD r20, r20
    LDI r6, 48
    ADD r6, r20
    LDI r21, SCRATCH
    STORE r21, r6
    LDI r6, 0
    LDI r3, 1
    ADD r21, r3
    STORE r21, r6
    LDI r20, STR_BUF
    STRO r20, "Round:"
    LDI r3, 160
    LDI r5, 214
    LDI r1, STR_BUF
    TEXT r3, r5, r1
    LDI r3, 210
    LDI r5, 214
    LDI r1, SCRATCH
    TEXT r3, r5, r1

    ; Draw 4 buttons (dim colors normally)
    ; Red button (top)
    LDI r3, 88
    LDI r5, 30
    LDI r1, 80
    LDI r0, 80
    LDI r6, 0x440000
    RECTF r3, r5, r1, r0, r6

    ; Green button (left)
    LDI r3, 20
    LDI r5, 130
    LDI r1, 80
    LDI r0, 80
    LDI r6, 0x004400
    RECTF r3, r5, r1, r0, r6

    ; Blue button (right)
    LDI r3, 156
    LDI r5, 130
    LDI r1, 80
    LDI r0, 80
    LDI r6, 0x000044
    RECTF r3, r5, r1, r0, r6

    ; Yellow button (bottom)
    LDI r3, 88
    LDI r5, 230
    LDI r1, 80
    LDI r0, 80
    LDI r6, 0x444400
    RECTF r3, r5, r1, r0, r6

    ; Highlight active button during showing phase
    LDI r20, PHASE
    LOAD r20, r20
    CMPI r20, 1
    JNZ r15, do_input_phase

    ; Showing phase - highlight the current sequence entry
    LDI r20, TIMER
    LOAD r20, r20
    ; Flash on for 15 frames, off for 10 frames = 25 frame cycle
    LDI r21, 25
    MOD r20, r21
    CMPI r20, 15
    BGE r15, do_show_off

    ; Flash on - get current sequence entry
    LDI r20, SHOW_IDX
    LOAD r20, r20
    LDI r21, SEQUENCE
    ADD r21, r20
    LOAD r20, r21
    ; Highlight based on button index
    CMPI r20, RED_BTN
    JNZ r15, check_green_show
    ; Highlight red
    LDI r3, 88
    LDI r5, 30
    LDI r1, 80
    LDI r0, 80
    LDI r6, 0xFF0000
    RECTF r3, r5, r1, r0, r6
    BEEP r3, r5
    JMP do_show_done
check_green_show:
    CMPI r20, GREEN_BTN
    JNZ r15, check_blue_show
    LDI r3, 20
    LDI r5, 130
    LDI r1, 80
    LDI r0, 80
    LDI r6, 0x00FF00
    RECTF r3, r5, r1, r0, r6
    BEEP r3, r5
    JMP do_show_done
check_blue_show:
    CMPI r20, BLUE_BTN
    JNZ r15, check_yellow_show
    LDI r3, 156
    LDI r5, 130
    LDI r1, 80
    LDI r0, 80
    LDI r6, 0x0000FF
    RECTF r3, r5, r1, r0, r6
    BEEP r3, r5
    JMP do_show_done
check_yellow_show:
    LDI r3, 88
    LDI r5, 230
    LDI r1, 80
    LDI r0, 80
    LDI r6, 0xFFFF00
    RECTF r3, r5, r1, r0, r6
    BEEP r3, r5
    JMP do_show_done

do_show_off:
do_show_done:
    ; Advance timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r3, 1
    ADD r21, r3
    STORE r20, r21
    ; Check if we need to move to next show entry
    LDI r20, TIMER
    LOAD r20, r20
    LDI r21, 25
    MOD r20, r21
    CMPI r20, 0
    JNZ r15, do_show_frame
    ; Timer hit cycle boundary - advance show index
    LDI r20, SHOW_IDX
    LOAD r21, r20
    LDI r3, 1
    ADD r21, r3
    STORE r20, r21
    ; Check if showing complete
    LDI r20, SHOW_IDX
    LOAD r20, r20
    LDI r21, SEQ_LEN
    LOAD r21, r21
    CMP r20, r21
    BLT r15, do_show_frame
    ; Showing complete - switch to input phase
    LDI r20, PHASE
    LDI r15, 2
    STORE r20, r15
    LDI r20, INPUT_IDX
    LDI r15, 0
    STORE r20, r15
    LDI r20, TIMER
    LDI r15, 0
    STORE r20, r15
    JMP register_hits

do_input_phase:
    ; Check for game over display
    LDI r20, PHASE
    LOAD r20, r20
    CMPI r20, 3
    JNZ r15, register_hits
    ; Game over - show message
    LDI r20, STR_BUF
    STRO r20, "GAME OVER"
    LDI r3, 78
    LDI r5, 230
    LDI r1, STR_BUF
    TEXT r3, r5, r1

do_show_frame:
register_hits:
    ; Register hit regions for 4 buttons
    LDI r3, 1
    ; Red
    LDI r6, 88
    LDI r13, 30
    LDI r10, 80
    LDI r2, 80
    HITSET r6, r13, r10, r2, 1
    ; Green
    LDI r6, 20
    LDI r13, 130
    LDI r10, 80
    LDI r2, 80
    HITSET r6, r13, r10, r2, 2
    ; Blue
    LDI r6, 156
    LDI r13, 130
    LDI r10, 80
    LDI r2, 80
    HITSET r6, r13, r10, r2, 3
    ; Yellow
    LDI r6, 88
    LDI r13, 230
    LDI r10, 80
    LDI r2, 80
    HITSET r6, r13, r10, r2, 4

    FRAME

    ; Only process input during input phase
    LDI r20, PHASE
    LOAD r20, r20
    CMPI r20, 2
    JNZ r15, main_loop

    HITQ r12
    CMPI r12, 0
    JZ r15, main_loop

    ; Player clicked a button - check against sequence
    LDI r20, INPUT_IDX
    LOAD r20, r20
    LDI r21, SEQUENCE
    ADD r21, r20
    LOAD r21, r21
    ; r12 = clicked button (1-4), r21 = expected (0-3)
    ; Convert click id to button index: id - 1
    MOV r22, r12
    LDI r3, 1
    SUB r22, r3
    ; Compare
    CMP r22, r21
    JZ r15, correct_click

    ; Wrong click - game over
    LDI r20, PHASE
    LDI r15, 3
    STORE r20, r15
    JMP main_loop

correct_click:
    ; Advance input index
    LDI r20, INPUT_IDX
    LOAD r21, r20
    LDI r3, 1
    ADD r21, r3
    STORE r20, r21
    ; Check if all inputs correct
    LDI r20, INPUT_IDX
    LOAD r20, r20
    LDI r21, SEQ_LEN
    LOAD r21, r21
    CMP r20, r21
    BLT r15, main_loop

    ; Round complete! Add score and extend sequence
    LDI r20, SCORE
    LOAD r21, r20
    LDI r3, 1
    ADD r21, r3
    STORE r20, r21

    ; Extend sequence
    LDI r20, SEQ_LEN
    LOAD r21, r20
    LDI r3, 1
    ADD r21, r3
    STORE r20, r21

    ; Generate new random entry at end of sequence
    RAND r20
    LDI r21, 4
    MOD r20, r21
    LDI r21, SEQ_LEN
    LOAD r22, r21
    LDI r3, 1
    SUB r22, r3
    LDI r23, SEQUENCE
    ADD r23, r22
    STORE r23, r20

    ; Start showing phase again
    LDI r20, SHOW_IDX
    LDI r15, 0
    STORE r20, r15
    LDI r20, PHASE
    LDI r15, 1
    STORE r20, r15
    LDI r20, TIMER
    LDI r15, 0
    STORE r20, r15

    JMP main_loop

    HALT
