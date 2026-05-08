; DESCRIPTION: Display a rectangle using color colored at the screen.

; preprocessor_test.asm
; Test the new abstraction layer

VAR score 0x4000
VAR player_x 0x4001

; Initialize variables
SET score, 10
SET player_x, 128

; Load back into registers
GET r7, score
GET r11, player_x

; Verify values in registers via PSET (visual check)
; If r7=10 and r11=128, it works
PSET r11, r7, r7

HALT
