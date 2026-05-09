; DESCRIPTION: Composite: Places a cyan dot at position (496, 4) then Places a green 72x15 rectangle at position (269, 96) then Renders a black disk with center (322, 76) and radius 66.
; PLAN: r0=496(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=96(y), r7=72(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=322(x), r11=76(y), r12=66(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 496
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 96
LDI r7, 72
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 76
LDI r12, 66
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
