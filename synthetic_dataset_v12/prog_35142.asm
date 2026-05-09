; DESCRIPTION: Composite: Places a green circle of radius 44 at center (125, 157) then Renders a purple line between points (433, 218) and (133, 88) then Places a green dot at position (246, 92).
; PLAN: r0=125(x), r1=157(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=218(y1), r7=133(x2), r8=88(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=246(x), r11=92(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 125
LDI r1, 157
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 218
LDI r7, 133
LDI r8, 88
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 92
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
