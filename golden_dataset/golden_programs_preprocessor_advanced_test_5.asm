; DESCRIPTION: A colored object centered at the screen with fixed size.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r6 and r7 to specific values
LDI r6, 0x1234
LDI r7, 0x5678

; Use SET - should use r28/r29, not r6/r7
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r6 and r7 are untouched
; r6 should be 0x1234, r7 should be 0x5678
GET r0, score

HALT
