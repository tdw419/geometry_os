; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r3 and r1 to specific values
LDI r3, 0x1234
LDI r1, 0x5678

; Use SET - should use r28/r29, not r3/r1
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r3 and r1 are untouched
; r3 should be 0x1234, r1 should be 0x5678
GET r9, score

HALT
