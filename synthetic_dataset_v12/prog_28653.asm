; DESCRIPTION: Composite: Places a orange dot at position (226, 38) then Places a red circle of radius 62 at center (254, 93) then Places a black 90x104 rectangle at position (100, 119).
; PLAN: r0=226(x), r1=38(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=93(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x), r11=119(y), r12=90(width), r13=104(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 226
LDI r1, 38
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 254
LDI r6, 93
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 119
LDI r12, 90
LDI r13, 104
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
