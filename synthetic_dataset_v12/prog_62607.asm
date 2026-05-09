; DESCRIPTION: Composite: Creates a black circular shape at (474, 64) with radius 33 then Sets a single green pixel at (360, 15) then Places a yellow 44x68 rectangle at position (189, 164).
; PLAN: r0=474(x), r1=64(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=15(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=189(x), r11=164(y), r12=44(width), r13=68(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 474
LDI r1, 64
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 15
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 189
LDI r11, 164
LDI r12, 44
LDI r13, 68
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
