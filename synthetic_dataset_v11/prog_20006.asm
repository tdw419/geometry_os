; DESCRIPTION: Composite: . Then Renders a black line between points (3, 0) and (173, 136). Then Draws a magenta circle centered at (98, 91) with radius 68.
; PLAN: r0=3(x1), r1=0(y1), r2=173(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=98(x), r1=91(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (3, 0) and (173, 136).
; PLAN: r0=3(x1), r1=0(y1), r2=173(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 0
LDI r2, 173
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (98, 91) with radius 68.
; PLAN: r0=98(x), r1=91(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 91
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
