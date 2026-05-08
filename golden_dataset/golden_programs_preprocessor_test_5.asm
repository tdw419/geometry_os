; DESCRIPTION: Draw rectangle: pos=the screen, color=colored, size=fixed size.

; preprocessor_test.asm
; Test the new abstraction layer

VAR score 0x4000
VAR player_x 0x4001

; Initialize variables
SET score, 10
SET player_x, 128

; Load back into registers
GET r5, score
GET r14, player_x

; Verify values in registers via PSET (visual check)
; If r5=10 and r14=128, it works
PSET r14, r5, r5

HALT
