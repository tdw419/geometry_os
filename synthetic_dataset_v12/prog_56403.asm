; DESCRIPTION: Composite: Places a purple 19x32 rectangle at position (141, 23) then Sets a single black pixel at (117, 34) then Places a blue line segment connecting (467, 250) to (449, 163).
; PLAN: r0=141(x), r1=23(y), r2=19(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=34(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=467(x1), r11=250(y1), r12=449(x2), r13=163(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 23
LDI r2, 19
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 34
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 467
LDI r11, 250
LDI r12, 449
LDI r13, 163
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
