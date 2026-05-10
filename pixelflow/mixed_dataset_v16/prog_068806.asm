; DESCRIPTION: Composite: Places a orange dot at position (258, 211) then Places a orange circle of radius 42 at center (297, 69) then Creates a black rectangular region at (66, 155) spanning 59 by 21 pixels.
; PLAN: r0=258(x), r1=211(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=69(y), r7=42(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=66(x), r11=155(y), r12=59(width), r13=21(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 211
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 297
LDI r6, 69
LDI r7, 42
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 66
LDI r11, 155
LDI r12, 59
LDI r13, 21
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
