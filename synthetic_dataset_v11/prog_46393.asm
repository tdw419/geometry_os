; DESCRIPTION: Composite: . Then Places a purple line segment connecting (219, 137) to (144, 136). Then Draws a orange rectangle at (73, 68) with width 21 and height 77.
; PLAN: r0=219(x1), r1=137(y1), r2=144(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=73(x), r1=68(y), r2=21(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (219, 137) to (144, 136).
; PLAN: r0=219(x1), r1=137(y1), r2=144(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 137
LDI r2, 144
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange rectangle at (73, 68) with width 21 and height 77.
; PLAN: r0=73(x), r1=68(y), r2=21(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 68
LDI r2, 21
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
