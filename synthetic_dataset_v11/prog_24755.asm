; DESCRIPTION: Composite: . Then Draws a orange rectangle at (66, 66) with width 13 and height 46. Then Draws a purple line from (150, 25) to (186, 167).
; PLAN: r0=66(x), r1=66(y), r2=13(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=150(x1), r1=25(y1), r2=186(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange rectangle at (66, 66) with width 13 and height 46.
; PLAN: r0=66(x), r1=66(y), r2=13(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 66
LDI r2, 13
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (150, 25) to (186, 167).
; PLAN: r0=150(x1), r1=25(y1), r2=186(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 25
LDI r2, 186
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
