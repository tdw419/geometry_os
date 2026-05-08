; DESCRIPTION: This GeOS assembly code tests the safety of registers during operations like INC (increment) and DEC (decrement). It initializes specific values in registers `r4` and `r14`, sets a variable `score` to 100 using the SET instruction, increments `score` by one, decrements it back to 100, and finally halts while ensuring that the original values in `r4` and `r14` remain unchanged.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r4 and r14 to specific values
LDI r4, 0x1234
LDI r14, 0x5678

; Use SET - should use r28/r29, not r4/r14
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r4 and r14 are untouched
; r4 should be 0x1234, r14 should be 0x5678
GET r0, score

HALT
