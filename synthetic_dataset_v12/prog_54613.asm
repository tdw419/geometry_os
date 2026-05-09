; DESCRIPTION: Composite: Places a orange dot at position (507, 225) then Places a yellow 120x116 rectangle at position (248, 108) then Creates a magenta circular shape at (104, 200) with radius 33.
; PLAN: r0=507(x), r1=225(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=248(x), r6=108(y), r7=120(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x), r11=200(y), r12=33(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 507
LDI r1, 225
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 248
LDI r6, 108
LDI r7, 120
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 200
LDI r12, 33
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
