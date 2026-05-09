; DESCRIPTION: Composite: Places a yellow 27x34 rectangle at position (136, 107) then Renders a black disk with center (77, 178) and radius 26 then Sets a single black pixel at (122, 193).
; PLAN: r0=136(x), r1=107(y), r2=27(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=178(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x), r11=193(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 107
LDI r2, 27
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 178
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 193
LDI r12, 0x000000
PSET r10, r11, r12
HALT
