; DESCRIPTION: Composite: Renders a white line between points (412, 153) and (454, 105) then Draws a magenta circle centered at (118, 181) with radius 65.
; PLAN: r0=412(x1), r1=153(y1), r2=454(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=181(y), r7=65(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 412
LDI r1, 153
LDI r2, 454
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 181
LDI r7, 65
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
