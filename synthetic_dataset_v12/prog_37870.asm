; DESCRIPTION: Composite: Creates a blue circular shape at (304, 121) with radius 50 then Sets a single blue pixel at (222, 121) then Places a cyan 20x23 rectangle at position (356, 2).
; PLAN: r0=304(x), r1=121(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=121(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=356(x), r11=2(y), r12=20(width), r13=23(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 121
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 121
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 356
LDI r11, 2
LDI r12, 20
LDI r13, 23
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
