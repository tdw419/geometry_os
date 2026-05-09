; DESCRIPTION: Composite: Places a orange dot at position (356, 215) then Places a orange 12x18 rectangle at position (20, 68) then Creates a yellow circular shape at (383, 99) with radius 43.
; PLAN: r0=356(x), r1=215(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=68(y), r7=12(width), r8=18(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x), r11=99(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 356
LDI r1, 215
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 20
LDI r6, 68
LDI r7, 12
LDI r8, 18
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 99
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
