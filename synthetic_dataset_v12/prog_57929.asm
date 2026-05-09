; DESCRIPTION: Composite: Draws a white line from (58, 26) to (112, 185) then Creates a magenta circular shape at (144, 136) with radius 58.
; PLAN: r0=58(x1), r1=26(y1), r2=112(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=136(y), r7=58(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 26
LDI r2, 112
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 136
LDI r7, 58
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
