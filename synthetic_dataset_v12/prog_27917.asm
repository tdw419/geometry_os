; DESCRIPTION: Composite: Places a white dot at position (68, 164) then Renders a blue disk with center (414, 168) and radius 62 then Creates a black rectangular region at (376, 149) spanning 13 by 73 pixels.
; PLAN: r0=68(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=168(y), r7=62(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=149(y), r12=13(width), r13=73(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 164
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 168
LDI r7, 62
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 149
LDI r12, 13
LDI r13, 73
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
