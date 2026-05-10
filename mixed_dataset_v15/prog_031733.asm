; DESCRIPTION: Composite: Places a yellow circle of radius 29 at center (119, 83) then Renders a white box of size 11x108 starting at (324, 44) then Sets a single orange pixel at (92, 172).
; PLAN: r0=119(x), r1=83(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x), r6=44(y), r7=11(width), r8=108(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x), r11=172(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 83
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 44
LDI r7, 11
LDI r8, 108
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 172
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
