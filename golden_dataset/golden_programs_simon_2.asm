; DESCRIPTION: A red rectangle centered at the screen with fixed size.

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
    LDI r0, 1
    LDI r30, 0xFD00

    ; Initialize game
    LDI r20, SEQ_LEN
    LDI r14, 1
    STORE r20, r14
    LDI r20, PHASE
    STORE r20, r14
    LDI r20, INPUT_IDX
    STORE r20, r14
    LDI r20, SCORE
    STORE r20, r14
    LDI r20, TIMER
    STORE r20, r14

    ; Generate first sequence entry
    RAND r20
    LDI r21, 4
    MOD r20, r21
    LDI r21, SEQUENCE
    STORE r21, r20

    ; Start in showing phase
    LDI r20, SHOW_IDX
    LDI r14, 0
    STORE r20, r14
    LDI r20, PHASE
    LDI r14, 1
    STORE r20, r14
    LDI r20, TIMER
    LDI r14, 0
    STORE r20, r14

; ── MAIN LOOP ──────────────────────────────────
main_loop:
    ; Dark background
    LDI r7, 0x111122
    FILL r7

    ; Title
    LDI r20, STR_BUF
    STRO r20, "SIMON SAYS"
    LDI r0, 72
    LDI r13, 6
    LDI r11, STR_BUF
    TEXT r0, r13, r11

    ; Score
    LDI r20, SCORE
    LOAD r20, r20
    LDI r7, 48
    ADD r7, r20
    LDI r21, SCRATCH
    STORE r21, r7
    LDI r7, 0
    LDI r0, 1
    ADD r21, r0
    STORE r21, r7
    LDI r20, STR_BUF
    STRO r20, "Score:"
    LDI r0, 8
    LDI r13, 214
    LDI r11, STR_BUF
    TEXT r0, r13, r11
    LDI r0, 56
    LDI r13, 214
    LDI r11, SCRATCH
    TEXT r0, r13, r11

    ; Round display
    LDI r20, SEQ_LEN
    LOAD r20, r20
    LDI r7, 48
    ADD r7, r20
    LDI r21, SCRATCH
    STORE r21, r7
    LDI r7, 0
    LDI r0, 1
    ADD r21, r0
    STORE r21, r7
    LDI r20, STR_BUF
    STRO r20, "Round:"
    LDI r0, 160
    LDI r13, 214
    LDI r11, STR_BUF
    TEXT r0, r13, r11
    LDI r0, 210
    LDI r13, 214
    LDI r11, SCRATCH
    TEXT r0, r13, r11

    ; Draw 4 buttons (dim colors normally)
    ; Red button (top)
    LDI r0, 88
    LDI r13, 30
    LDI r11, 80
    LDI r1, 80
    LDI r7, 0x440000
    RECTF r0, r13, r11, r1, r7

    ; Green button (left)
    LDI r0, 20
    LDI r13, 130
    LDI r11, 80
    LDI r1, 80
    LDI r7, 0x004400
    RECTF r0, r13, r11, r1, r7

    ; Blue button (right)
    LDI r0, 156
    LDI r13, 130
    LDI r11, 80
    LDI r1, 80
    LDI r7, 0x000044
    RECTF r0, r13, r11, r1, r7

    ; Yellow button (bottom)
    LDI r0, 88
    LDI r13, 230
    LDI r11, 80
    LDI r1, 80
    LDI r7, 0x444400
    RECTF r0, r13, r11, r1, r7

    ; Highlight active button during showing phase
    LDI r20, PHASE
    LOAD r20, r20
    CMPI r20, 1
    JNZ r14, do_input_phase

    ; Showing phase - highlight the current sequence entry
    LDI r20, TIMER
    LOAD r20, r20
    ; Flash on for 15 frames, off for 10 frames = 25 frame cycle
    LDI r21, 25
    MOD r20, r21
    CMPI r20, 15
    BGE r14, do_show_off

    ; Flash on - get current sequence entry
    LDI r20, SHOW_IDX
    LOAD r20, r20
    LDI r21, SEQUENCE
    ADD r21, r20
    LOAD r20, r21
    ; Highlight based on button index
    CMPI r20, RED_BTN
    JNZ r14, check_green_show
    ; Highlight red
    LDI r0, 88
    LDI r13, 30
    LDI r11, 80
    LDI r1, 80
    LDI r7, 0xFF0000
    RECTF r0, r13, r11, r1, r7
    BEEP r0, r13
    JMP do_show_done
check_green_show:
    CMPI r20, GREEN_BTN
    JNZ r14, check_blue_show
    LDI r0, 20
    LDI r13, 130
    LDI r11, 80
    LDI r1, 80
    LDI r7, 0x00FF00
    RECTF r0, r13, r11, r1, r7
    BEEP r0, r13
    JMP do_show_done
check_blue_show:
    CMPI r20, BLUE_BTN
    JNZ r14, check_yellow_show
    LDI r0, 156
    LDI r13, 130
    LDI r11, 80
    LDI r1, 80
    LDI r7, 0x0000FF
    RECTF r0, r13, r11, r1, r7
    BEEP r0, r13
    JMP do_show_done
check_yellow_show:
    LDI r0, 88
    LDI r13, 230
    LDI r11, 80
    LDI r1, 80
    LDI r7, 0xFFFF00
    RECTF r0, r13, r11, r1, r7
    BEEP r0, r13
    JMP do_show_done

do_show_off:
do_show_done:
    ; Advance timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r0, 1
    ADD r21, r0
    STORE r20, r21
    ; Check if we need to move to next show entry
    LDI r20, TIMER
    LOAD r20, r20
    LDI r21, 25
    MOD r20, r21
    CMPI r20, 0
    JNZ r14, do_show_frame
    ; Timer hit cycle boundary - advance show index
    LDI r20, SHOW_IDX
    LOAD r21, r20
    LDI r0, 1
    ADD r21, r0
    STORE r20, r21
    ; Check if showing complete
    LDI r20, SHOW_IDX
    LOAD r20, r20
    LDI r21, SEQ_LEN
    LOAD r21, r21
    CMP r20, r21
    BLT r14, do_show_frame
    ; Showing complete - switch to input phase
    LDI r20, PHASE
    LDI r14, 2
    STORE r20, r14
    LDI r20, INPUT_IDX
    LDI r14, 0
    STORE r20, r14
    LDI r20, TIMER
    LDI r14, 0
    STORE r20, r14
    JMP register_hits

do_input_phase:
    ; Check for game over display
    LDI r20, PHASE
    LOAD r20, r20
    CMPI r20, 3
    JNZ r14, register_hits
    ; Game over - show message
    LDI r20, STR_BUF
    STRO r20, "GAME OVER"
    LDI r0, 78
    LDI r13, 230
    LDI r11, STR_BUF
    TEXT r0, r13, r11

do_show_frame:
register_hits:
    ; Register hit regions for 4 buttons
    LDI r0, 1
    ; Red
    LDI r7, 88
    LDI r8, 30
    LDI r15, 80
    LDI r4, 80
    HITSET r7, r8, r15, r4, 1
    ; Green
    LDI r7, 20
    LDI r8, 130
    LDI r15, 80
    LDI r4, 80
    HITSET r7, r8, r15, r4, 2
    ; Blue
    LDI r7, 156
    LDI r8, 130
    LDI r15, 80
    LDI r4, 80
    HITSET r7, r8, r15, r4, 3
    ; Yellow
    LDI r7, 88
    LDI r8, 230
    LDI r15, 80
    LDI r4, 80
    HITSET r7, r8, r15, r4, 4

    FRAME

    ; Only process input during input phase
    LDI r20, PHASE
    LOAD r20, r20
    CMPI r20, 2
    JNZ r14, main_loop

    HITQ r10
    CMPI r10, 0
    JZ r14, main_loop

    ; Player clicked a button - check against sequence
    LDI r20, INPUT_IDX
    LOAD r20, r20
    LDI r21, SEQUENCE
    ADD r21, r20
    LOAD r21, r21
    ; r10 = clicked button (1-4), r21 = expected (0-3)
    ; Convert click id to button index: id - 1
    MOV r22, r10
    LDI r0, 1
    SUB r22, r0
    ; Compare
    CMP r22, r21
    JZ r14, correct_click

    ; Wrong click - game over
    LDI r20, PHASE
    LDI r14, 3
    STORE r20, r14
    JMP main_loop

correct_click:
    ; Advance input index
    LDI r20, INPUT_IDX
    LOAD r21, r20
    LDI r0, 1
    ADD r21, r0
    STORE r20, r21
    ; Check if all inputs correct
    LDI r20, INPUT_IDX
    LOAD r20, r20
    LDI r21, SEQ_LEN
    LOAD r21, r21
    CMP r20, r21
    BLT r14, main_loop

    ; Round complete! Add score and extend sequence
    LDI r20, SCORE
    LOAD r21, r20
    LDI r0, 1
    ADD r21, r0
    STORE r20, r21

    ; Extend sequence
    LDI r20, SEQ_LEN
    LOAD r21, r20
    LDI r0, 1
    ADD r21, r0
    STORE r20, r21

    ; Generate new random entry at end of sequence
    RAND r20
    LDI r21, 4
    MOD r20, r21
    LDI r21, SEQ_LEN
    LOAD r22, r21
    LDI r0, 1
    SUB r22, r0
    LDI r23, SEQUENCE
    ADD r23, r22
    STORE r23, r20

    ; Start showing phase again
    LDI r20, SHOW_IDX
    LDI r14, 0
    STORE r20, r14
    LDI r20, PHASE
    LDI r14, 1
    STORE r20, r14
    LDI r20, TIMER
    LDI r14, 0
    STORE r20, r14

    JMP main_loop

    HALT
