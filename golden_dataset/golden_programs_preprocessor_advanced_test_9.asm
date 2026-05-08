; DESCRIPTION: Geometry OS program to draw a colored object.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r14 and r12 to specific values
LDI r14, 0x1234
LDI r12, 0x5678

; Use SET - should use r28/r29, not r14/r12
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r14 and r12 are untouched
; r14 should be 0x1234, r12 should be 0x5678
GET r4, score

HALT
