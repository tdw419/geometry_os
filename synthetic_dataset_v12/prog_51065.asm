; DESCRIPTION: Composite: Places a white dot at position (233, 21) then Renders a black line between points (133, 9) and (253, 140) then Renders a orange disk with center (435, 72) and radius 15.
; PLAN: r0=233(x), r1=21(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=133(x1), r6=9(y1), r7=253(x2), r8=140(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=72(y), r12=15(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 21
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 9
LDI r7, 253
LDI r8, 140
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 72
LDI r12, 15
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
