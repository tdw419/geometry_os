; DESCRIPTION: Composite: . Then Draws a purple line from (143, 212) to (206, 9). Then Draws a magenta rectangle at (160, 23) with width 49 and height 30.
; PLAN: r0=143(x1), r1=212(y1), r2=206(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=160(x), r1=23(y), r2=49(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (143, 212) to (206, 9).
; PLAN: r0=143(x1), r1=212(y1), r2=206(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 212
LDI r2, 206
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (160, 23) with width 49 and height 30.
; PLAN: r0=160(x), r1=23(y), r2=49(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 23
LDI r2, 49
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
