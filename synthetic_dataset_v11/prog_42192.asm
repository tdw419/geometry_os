; DESCRIPTION: Composite: . Then Draws a black rectangle at (70, 147) with width 78 and height 95. Then Renders a orange line between points (226, 219) and (137, 32).
; PLAN: r0=70(x), r1=147(y), r2=78(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=226(x1), r1=219(y1), r2=137(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (70, 147) with width 78 and height 95.
; PLAN: r0=70(x), r1=147(y), r2=78(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 147
LDI r2, 78
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (226, 219) and (137, 32).
; PLAN: r0=226(x1), r1=219(y1), r2=137(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 219
LDI r2, 137
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
