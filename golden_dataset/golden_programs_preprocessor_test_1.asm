; DESCRIPTION: This GeOS assembly code initializes two variables, `score` and `player_x`, at memory addresses 0x4000 and 0x4001 respectively. It sets the values of these variables to 10 and 128, then retrieves them into registers r4 and r1 for verification using the PSET instruction, which visually checks if the register contents are correct by plotting a pixel at coordinates (r1, r4).

; preprocessor_test.asm
; Test the new abstraction layer

VAR score 0x4000
VAR player_x 0x4001

; Initialize variables
SET score, 10
SET player_x, 128

; Load back into registers
GET r4, score
GET r1, player_x

; Verify values in registers via PSET (visual check)
; If r4=10 and r1=128, it works
PSET r1, r4, r4

HALT
