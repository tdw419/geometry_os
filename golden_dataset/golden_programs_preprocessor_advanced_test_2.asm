; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r9 and r3 to specific values
LDI r9, 0x1234
LDI r3, 0x5678

; Use SET - should use r28/r29, not r9/r3
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r9 and r3 are untouched
; r9 should be 0x1234, r3 should be 0x5678
GET r11, score

HALT
