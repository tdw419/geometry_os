; DESCRIPTION: Composite: Renders a red line between points (344, 193) and (29, 72) then Renders a purple disk with center (318, 114) and radius 63.
; PLAN: r0=344(x1), r1=193(y1), r2=29(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=114(y), r7=63(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 344
LDI r1, 193
LDI r2, 29
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 114
LDI r7, 63
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
