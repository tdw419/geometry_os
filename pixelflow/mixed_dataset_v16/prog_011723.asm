; DESCRIPTION: Composite: Places a white dot at position (255, 184) then Places a black circle of radius 43 at center (402, 203) then Places a red line segment connecting (241, 119) to (272, 187).
; PLAN: r0=255(x), r1=184(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=402(x), r6=203(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x1), r11=119(y1), r12=272(x2), r13=187(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 184
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 402
LDI r6, 203
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 119
LDI r12, 272
LDI r13, 187
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
