; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r2 and r0 to specific values
LDI r2, 0x1234
LDI r0, 0x5678

; Use SET - should use r28/r29, not r2/r0
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r2 and r0 are untouched
; r2 should be 0x1234, r0 should be 0x5678
GET r12, score

HALT
