; DESCRIPTION: Composite: Draws a yellow circle centered at (314, 183) with radius 24 then Renders a magenta line between points (130, 97) and (435, 95) then Sets a single purple pixel at (246, 153).
; PLAN: r0=314(x), r1=183(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x1), r6=97(y1), r7=435(x2), r8=95(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=246(x), r11=153(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 314
LDI r1, 183
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 97
LDI r7, 435
LDI r8, 95
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 153
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
