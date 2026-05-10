; DESCRIPTION: Composite: Places a orange dot at position (343, 226) then Places a white 49x119 rectangle at position (403, 57) then Creates a cyan circular shape at (360, 100) with radius 46.
; PLAN: r0=343(x), r1=226(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=57(y), r7=49(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=360(x), r11=100(y), r12=46(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 343
LDI r1, 226
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 403
LDI r6, 57
LDI r7, 49
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 100
LDI r12, 46
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
