; DESCRIPTION: Composite: Places a white 56x79 rectangle at position (43, 116) then Sets a single black pixel at (306, 86) then Renders a green disk with center (90, 64) and radius 41.
; PLAN: r0=43(x), r1=116(y), r2=56(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=86(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=90(x), r11=64(y), r12=41(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 43
LDI r1, 116
LDI r2, 56
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 86
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 90
LDI r11, 64
LDI r12, 41
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
