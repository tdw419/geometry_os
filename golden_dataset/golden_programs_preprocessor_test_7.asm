; DESCRIPTION: Render a colored rectangle at the screen.

; preprocessor_test.asm
; Test the new abstraction layer

VAR score 0x4000
VAR player_x 0x4001

; Initialize variables
SET score, 10
SET player_x, 128

; Load back into registers
GET r12, score
GET r4, player_x

; Verify values in registers via PSET (visual check)
; If r12=10 and r4=128, it works
PSET r4, r12, r12

HALT
