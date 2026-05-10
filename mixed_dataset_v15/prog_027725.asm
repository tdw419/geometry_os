; DESCRIPTION: Composite: Renders a purple disk with center (198, 198) and radius 23 then Renders a yellow line between points (223, 72) and (81, 114) then Sets a single green pixel at (29, 2).
; PLAN: r0=198(x), r1=198(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x1), r6=72(y1), r7=81(x2), r8=114(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=29(x), r11=2(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 198
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 72
LDI r7, 81
LDI r8, 114
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 2
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
