; DESCRIPTION: Composite: Places a magenta line segment connecting (97, 146) to (132, 124) then Draws a magenta circle centered at (201, 62) with radius 29.
; PLAN: r0=97(x1), r1=146(y1), r2=132(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=62(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 146
LDI r2, 132
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 62
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
