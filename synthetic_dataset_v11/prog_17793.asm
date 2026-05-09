; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (147, 50) with width 11 and height 50. Then Draws a purple line from (91, 252) to (206, 70).
; PLAN: r0=147(x), r1=50(y), r2=11(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=91(x1), r1=252(y1), r2=206(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta rectangle at (147, 50) with width 11 and height 50.
; PLAN: r0=147(x), r1=50(y), r2=11(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 50
LDI r2, 11
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (91, 252) to (206, 70).
; PLAN: r0=91(x1), r1=252(y1), r2=206(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 252
LDI r2, 206
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
