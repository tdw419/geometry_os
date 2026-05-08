; DESCRIPTION: This GeOS assembly code tests the safety of registers during operations like INC (increment) and DEC (decrement). It initializes specific values in registers `r2` and `r8`, sets a variable `score` to 100 using the SET instruction, increments `score` by one, decrements it back to 100, and finally halts while ensuring that the original values in `r2` and `r8` remain unchanged.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r2 and r8 to specific values
LDI r2, 0x1234
LDI r8, 0x5678

; Use SET - should use r28/r29, not r2/r8
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r2 and r8 are untouched
; r2 should be 0x1234, r8 should be 0x5678
GET r10, score

HALT
