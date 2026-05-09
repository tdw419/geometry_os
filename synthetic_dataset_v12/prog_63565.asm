; DESCRIPTION: Composite: Places a cyan dot at position (54, 28) then Draws a cyan circle centered at (223, 154) with radius 64 then Creates a orange rectangular region at (68, 68) spanning 22 by 119 pixels.
; PLAN: r0=54(x), r1=28(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=154(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=68(y), r12=22(width), r13=119(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 28
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 154
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 68
LDI r12, 22
LDI r13, 119
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
