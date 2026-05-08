; DESCRIPTION: This GeOS assembly code tests the safety of registers during operations like INC (increment) and DEC (decrement). It initializes specific values in registers `r5` and `r7`, sets a variable `score` to 100 using the SET instruction, increments `score` by one, decrements it back to 100, and finally halts while ensuring that the original values in `r5` and `r7` remain unchanged.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r5 and r7 to specific values
LDI r5, 0x1234
LDI r7, 0x5678

; Use SET - should use r28/r29, not r5/r7
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r5 and r7 are untouched
; r5 should be 0x1234, r7 should be 0x5678
GET r0, score

HALT
