; DESCRIPTION: Composite: Places a yellow circle of radius 31 at center (259, 153) then Places a purple 100x56 rectangle at position (92, 169) then Sets a single blue pixel at (173, 108).
; PLAN: r0=259(x), r1=153(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=169(y), r7=100(width), r8=56(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x), r11=108(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 259
LDI r1, 153
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 169
LDI r7, 100
LDI r8, 56
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 108
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
