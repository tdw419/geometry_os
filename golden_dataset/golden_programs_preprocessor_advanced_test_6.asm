; DESCRIPTION: Draws a colored object at the screen with fixed size.

; preprocessor_advanced_test.asm
; Test register safety and INC/DEC

VAR score 0x4000

; Set r11 and r6 to specific values
LDI r11, 0x1234
LDI r6, 0x5678

; Use SET - should use r28/r29, not r11/r6
SET score, 100

; Use INC
INC score
; score should now be 101

; Use DEC
DEC score
; score should be back to 100

; Verify r11 and r6 are untouched
; r11 should be 0x1234, r6 should be 0x5678
GET r0, score

HALT
