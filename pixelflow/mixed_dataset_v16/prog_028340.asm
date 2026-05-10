; DESCRIPTION: Composite: Renders a black disk with center (191, 126) and radius 22 then Sets a single magenta pixel at (113, 86) then Draws a red line from (35, 76) to (478, 78).
; PLAN: r0=191(x), r1=126(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=86(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=35(x1), r11=76(y1), r12=478(x2), r13=78(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 126
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 86
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 35
LDI r11, 76
LDI r12, 478
LDI r13, 78
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
