; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

; preprocessor_test.asm
; Test the new abstraction layer

VAR score 0x4000
VAR player_x 0x4001

; Initialize variables
SET score, 10
SET player_x, 128

; Load back into registers
GET r8, score
GET r12, player_x

; Verify values in registers via PSET (visual check)
; If r8=10 and r12=128, it works
PSET r12, r8, r8

HALT
