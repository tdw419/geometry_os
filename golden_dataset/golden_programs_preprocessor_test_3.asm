; DESCRIPTION: This GeOS assembly code initializes two variables, `score` and `player_x`, at memory addresses 0x4000 and 0x4001 respectively. It sets the values of these variables to 10 and 128, then retrieves them into registers r13 and r2 for verification using the PSET instruction, which visually checks if the register contents are correct by plotting a pixel at coordinates (r2, r13).

; preprocessor_test.asm
; Test the new abstraction layer

VAR score 0x4000
VAR player_x 0x4001

; Initialize variables
SET score, 10
SET player_x, 128

; Load back into registers
GET r13, score
GET r2, player_x

; Verify values in registers via PSET (visual check)
; If r13=10 and r2=128, it works
PSET r2, r13, r13

HALT
