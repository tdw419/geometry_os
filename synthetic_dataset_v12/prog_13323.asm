; DESCRIPTION: Composite: Places a purple 35x26 rectangle at position (117, 133) then Places a yellow circle of radius 33 at center (469, 185) then Sets a single orange pixel at (65, 177).
; PLAN: r0=117(x), r1=133(y), r2=35(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x), r6=185(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=65(x), r11=177(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 117
LDI r1, 133
LDI r2, 35
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 185
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 65
LDI r11, 177
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
