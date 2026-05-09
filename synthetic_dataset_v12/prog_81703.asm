; DESCRIPTION: Composite: Renders a yellow disk with center (439, 105) and radius 41 then Places a yellow dot at position (135, 79) then Creates a black rectangular region at (223, 1) spanning 14 by 76 pixels.
; PLAN: r0=439(x), r1=105(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=79(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=223(x), r11=1(y), r12=14(width), r13=76(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 105
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 79
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 223
LDI r11, 1
LDI r12, 14
LDI r13, 76
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
