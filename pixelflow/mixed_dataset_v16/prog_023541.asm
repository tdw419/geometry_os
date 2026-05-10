; DESCRIPTION: Composite: Renders a white disk with center (142, 121) and radius 76 then Places a orange dot at position (244, 106) then Creates a green rectangular region at (464, 82) spanning 40 by 71 pixels.
; PLAN: r0=142(x), r1=121(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x), r6=106(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=464(x), r11=82(y), r12=40(width), r13=71(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 121
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 106
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 464
LDI r11, 82
LDI r12, 40
LDI r13, 71
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
