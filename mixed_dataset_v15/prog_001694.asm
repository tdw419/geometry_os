; DESCRIPTION: Composite: Places a yellow line segment connecting (413, 16) to (98, 175) then Draws a magenta circle centered at (138, 181) with radius 24.
; PLAN: r0=413(x1), r1=16(y1), r2=98(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=181(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 413
LDI r1, 16
LDI r2, 98
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 181
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
