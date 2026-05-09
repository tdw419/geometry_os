; DESCRIPTION: Composite: Renders a magenta line between points (189, 34) and (427, 209) then Sets a single orange pixel at (303, 113) then Draws a magenta circle centered at (199, 196) with radius 56.
; PLAN: r0=189(x1), r1=34(y1), r2=427(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=113(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=199(x), r11=196(y), r12=56(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 189
LDI r1, 34
LDI r2, 427
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 113
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 199
LDI r11, 196
LDI r12, 56
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
