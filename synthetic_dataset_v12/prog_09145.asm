; DESCRIPTION: Composite: Renders a orange disk with center (272, 80) and radius 62 then Places a purple dot at position (278, 136) then Places a red line segment connecting (504, 55) to (1, 44).
; PLAN: r0=272(x), r1=80(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=136(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=504(x1), r11=55(y1), r12=1(x2), r13=44(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 80
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 136
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 504
LDI r11, 55
LDI r12, 1
LDI r13, 44
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
