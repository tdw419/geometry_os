; DESCRIPTION: Composite: Creates a purple circular shape at (302, 73) with radius 48 then Places a blue dot at position (414, 51) then Places a purple 67x31 rectangle at position (257, 170).
; PLAN: r0=302(x), r1=73(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=51(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=257(x), r11=170(y), r12=67(width), r13=31(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 73
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 51
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 257
LDI r11, 170
LDI r12, 67
LDI r13, 31
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
