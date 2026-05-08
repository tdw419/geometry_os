; DESCRIPTION: Geometry OS program to draw a colored object.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r15 and r1 to specific values
LDI r15, 0x1234
LDI r1, 0x5678

; Use SET - should use r28/r29, not r15/r1
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r15 and r1 are untouched
; r15 should be 0x1234, r1 should be 0x5678
GET r12, score

HALT
