; DESCRIPTION: Composite: Places a orange dot at position (269, 184) then Renders a red disk with center (308, 134) and radius 73 then Creates a cyan rectangular region at (142, 8) spanning 68 by 23 pixels.
; PLAN: r0=269(x), r1=184(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=134(y), r7=73(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=142(x), r11=8(y), r12=68(width), r13=23(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 184
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 308
LDI r6, 134
LDI r7, 73
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 142
LDI r11, 8
LDI r12, 68
LDI r13, 23
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
