; DESCRIPTION: Composite: Sets a single purple pixel at (22, 138) then Renders a green box of size 114x116 starting at (272, 130) then Creates a green circular shape at (244, 82) with radius 76.
; PLAN: r0=22(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=130(y), r7=114(width), r8=116(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=244(x), r11=82(y), r12=76(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 22
LDI r1, 138
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 130
LDI r7, 114
LDI r8, 116
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 82
LDI r12, 76
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
