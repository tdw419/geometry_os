; DESCRIPTION: Composite: Renders a purple line between points (267, 232) and (97, 6) then Renders a purple disk with center (292, 148) and radius 73 then Places a red dot at position (4, 106).
; PLAN: r0=267(x1), r1=232(y1), r2=97(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=148(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=106(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 267
LDI r1, 232
LDI r2, 97
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 148
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 106
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
