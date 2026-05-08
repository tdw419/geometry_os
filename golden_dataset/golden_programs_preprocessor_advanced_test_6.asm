; DESCRIPTION: This GeOS assembly code tests the safety of registers during operations like INC (increment) and DEC (decrement). It initializes specific values in registers `r3` and `r6`, sets a variable `score` to 100 using the SET instruction, increments `score` by one, decrements it back to 100, and finally halts while ensuring that the original values in `r3` and `r6` remain unchanged.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r3 and r6 to specific values
LDI r3, 0x1234
LDI r6, 0x5678

; Use SET - should use r28/r29, not r3/r6
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r3 and r6 are untouched
; r3 should be 0x1234, r6 should be 0x5678
GET r15, score

HALT
