; DESCRIPTION: Composite: Renders a magenta line between points (154, 223) and (31, 19) then Draws a yellow circle centered at (172, 158) with radius 68 then Sets a single purple pixel at (165, 58).
; PLAN: r0=154(x1), r1=223(y1), r2=31(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=158(y), r7=68(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=165(x), r11=58(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 223
LDI r2, 31
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 158
LDI r7, 68
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 165
LDI r11, 58
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
