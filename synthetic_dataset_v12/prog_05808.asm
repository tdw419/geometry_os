; DESCRIPTION: Composite: Places a purple circle of radius 54 at center (117, 95) then Places a black dot at position (199, 93) then Creates a cyan rectangular region at (26, 54) spanning 52 by 108 pixels.
; PLAN: r0=117(x), r1=95(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=93(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=26(x), r11=54(y), r12=52(width), r13=108(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 95
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 93
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 26
LDI r11, 54
LDI r12, 52
LDI r13, 108
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
