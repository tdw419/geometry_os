; DESCRIPTION: Geometry OS program to draw a colored rectangle.

; preprocessor_test.asm
; Test the new abstraction layer

VAR score 0x4000
VAR player_x 0x4001

; Initialize variables
SET score, 10
SET player_x, 128

; Load back into registers
GET r11, score
GET r4, player_x

; Verify values in registers via PSET (visual check)
; If r11=10 and r4=128, it works
PSET r4, r11, r11

HALT
