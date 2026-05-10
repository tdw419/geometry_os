; DESCRIPTION: Composite: Creates a green circular shape at (95, 62) with radius 45 then Draws a white rectangle at (92, 137) with width 83 and height 41 then Sets a single green pixel at (233, 10).
; PLAN: r0=95(x), r1=62(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=137(y), r7=83(width), r8=41(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=233(x), r11=10(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 62
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 137
LDI r7, 83
LDI r8, 41
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 10
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
