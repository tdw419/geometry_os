; DESCRIPTION: Composite: Renders a black box of size 76x54 starting at (76, 71) then Sets a single black pixel at (467, 13) then Renders a black disk with center (189, 163) and radius 28.
; PLAN: r0=76(x), r1=71(y), r2=76(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=13(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=189(x), r11=163(y), r12=28(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 76
LDI r1, 71
LDI r2, 76
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 13
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 189
LDI r11, 163
LDI r12, 28
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
