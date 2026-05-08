; DESCRIPTION: Render a colored object at the screen.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r9 and r0 to specific values
LDI r9, 0x1234
LDI r0, 0x5678

; Use SET - should use r28/r29, not r9/r0
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r9 and r0 are untouched
; r9 should be 0x1234, r0 should be 0x5678
GET r2, score

HALT
