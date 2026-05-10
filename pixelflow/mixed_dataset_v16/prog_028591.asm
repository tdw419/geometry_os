; DESCRIPTION: Composite: Renders a black line between points (248, 13) and (301, 123) then Places a white dot at position (318, 78) then Places a blue 38x58 rectangle at position (382, 163).
; PLAN: r0=248(x1), r1=13(y1), r2=301(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=78(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=382(x), r11=163(y), r12=38(width), r13=58(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 13
LDI r2, 301
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 78
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 382
LDI r11, 163
LDI r12, 38
LDI r13, 58
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
