; DESCRIPTION: Composite: Places a purple 21x38 rectangle at position (403, 101) then Sets a single blue pixel at (184, 12) then Draws a cyan circle centered at (143, 153) with radius 53.
; PLAN: r0=403(x), r1=101(y), r2=21(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=12(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=143(x), r11=153(y), r12=53(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 101
LDI r2, 21
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 12
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 143
LDI r11, 153
LDI r12, 53
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
