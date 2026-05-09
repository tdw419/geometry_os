; DESCRIPTION: Composite: Places a yellow dot at position (115, 115) then Draws a orange circle centered at (223, 135) with radius 35 then Creates a black rectangular region at (24, 42) spanning 109 by 14 pixels.
; PLAN: r0=115(x), r1=115(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=135(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=42(y), r12=109(width), r13=14(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 115
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 223
LDI r6, 135
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 42
LDI r12, 109
LDI r13, 14
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
