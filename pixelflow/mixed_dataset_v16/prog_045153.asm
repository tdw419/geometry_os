; DESCRIPTION: Composite: Places a orange dot at position (93, 242) then Places a blue 55x31 rectangle at position (95, 18) then Creates a yellow circular shape at (214, 76) with radius 58.
; PLAN: r0=93(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=18(y), r7=55(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=214(x), r11=76(y), r12=58(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 242
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 95
LDI r6, 18
LDI r7, 55
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 76
LDI r12, 58
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
