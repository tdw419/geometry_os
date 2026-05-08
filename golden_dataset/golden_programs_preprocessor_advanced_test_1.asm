; DESCRIPTION: This GeOS assembly code tests the safety of registers during operations like INC (increment) and DEC (decrement). It initializes specific values in registers `r6` and `r4`, sets a variable `score` to 100 using the SET instruction, increments `score` by one, decrements it back to 100, and finally halts while ensuring that the original values in `r6` and `r4` remain unchanged.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r6 and r4 to specific values
LDI r6, 0x1234
LDI r4, 0x5678

; Use SET - should use r28/r29, not r6/r4
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r6 and r4 are untouched
; r6 should be 0x1234, r4 should be 0x5678
GET r15, score

HALT
