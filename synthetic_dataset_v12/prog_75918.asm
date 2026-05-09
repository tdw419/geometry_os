; DESCRIPTION: Composite: Draws a yellow circle centered at (373, 73) with radius 44 then Renders a magenta line between points (462, 112) and (501, 161).
; PLAN: r0=373(x), r1=73(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=462(x1), r6=112(y1), r7=501(x2), r8=161(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 73
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 462
LDI r6, 112
LDI r7, 501
LDI r8, 161
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
