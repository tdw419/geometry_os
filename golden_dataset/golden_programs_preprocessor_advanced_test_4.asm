; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r1 and r5 to specific values
LDI r1, 0x1234
LDI r5, 0x5678

; Use SET - should use r28/r29, not r1/r5
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r1 and r5 are untouched
; r1 should be 0x1234, r5 should be 0x5678
GET r9, score

HALT
