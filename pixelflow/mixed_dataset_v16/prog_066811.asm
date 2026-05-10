; DESCRIPTION: Composite: Sets a single blue pixel at (268, 188) then Renders a red line between points (88, 142) and (419, 202) then Draws a magenta circle centered at (132, 182) with radius 42.
; PLAN: r0=268(x), r1=188(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=88(x1), r6=142(y1), r7=419(x2), r8=202(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=182(y), r12=42(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 268
LDI r1, 188
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 142
LDI r7, 419
LDI r8, 202
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 182
LDI r12, 42
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
