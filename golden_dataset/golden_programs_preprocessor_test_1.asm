; DESCRIPTION: Geometry OS program to draw a colored rectangle.

; preprocessor_test.asm
; Test the new abstraction layer

VAR score 0x4000
VAR player_x 0x4001

; Initialize variables
SET score, 10
SET player_x, 128

; Load back into registers
GET r4, score
GET r8, player_x

; Verify values in registers via PSET (visual check)
; If r4=10 and r8=128, it works
PSET r8, r4, r4

HALT
