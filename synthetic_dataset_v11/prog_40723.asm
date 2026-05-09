; DESCRIPTION: Composite: . Then Places a orange line segment connecting (219, 85) to (85, 94). Then Draws a purple rectangle at (100, 146) with width 31 and height 38.
; PLAN: r0=219(x1), r1=85(y1), r2=85(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=100(x), r1=146(y), r2=31(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (219, 85) to (85, 94).
; PLAN: r0=219(x1), r1=85(y1), r2=85(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 85
LDI r2, 85
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (100, 146) with width 31 and height 38.
; PLAN: r0=100(x), r1=146(y), r2=31(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 146
LDI r2, 31
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
