; DESCRIPTION: This GeOS assembly code initializes two variables, `score` and `player_x`, at memory addresses 0x4000 and 0x4001 respectively. It sets the values of these variables to 10 and 128, then retrieves them into registers r3 and r14 for verification using the PSET instruction, which visually checks if the register contents are correct by plotting a pixel at coordinates (r14, r3).

; preprocessor_test.asm
; Test the new abstraction layer

VAR score 0x4000
VAR player_x 0x4001

; Initialize variables
SET score, 10
SET player_x, 128

; Load back into registers
GET r3, score
GET r14, player_x

; Verify values in registers via PSET (visual check)
; If r3=10 and r14=128, it works
PSET r14, r3, r3

HALT
