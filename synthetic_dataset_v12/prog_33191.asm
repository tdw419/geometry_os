; DESCRIPTION: Composite: Renders a purple line between points (48, 71) and (33, 41) then Sets a single blue pixel at (457, 245) then Creates a white rectangular region at (107, 134) spanning 76 by 57 pixels.
; PLAN: r0=48(x1), r1=71(y1), r2=33(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=245(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=107(x), r11=134(y), r12=76(width), r13=57(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 71
LDI r2, 33
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 245
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 107
LDI r11, 134
LDI r12, 76
LDI r13, 57
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
