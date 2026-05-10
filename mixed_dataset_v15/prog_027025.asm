; DESCRIPTION: Composite: Places a cyan dot at position (43, 109) then Creates a black rectangular region at (66, 24) spanning 88 by 26 pixels then Renders a black disk with center (132, 66) and radius 26.
; PLAN: r0=43(x), r1=109(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=24(y), r7=88(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x), r11=66(y), r12=26(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 43
LDI r1, 109
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 24
LDI r7, 88
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 66
LDI r12, 26
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
