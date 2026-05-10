; DESCRIPTION: Composite: Places a purple circle of radius 79 at center (372, 161) then Sets a single magenta pixel at (12, 234) then Places a purple 78x10 rectangle at position (427, 26).
; PLAN: r0=372(x), r1=161(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=234(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=427(x), r11=26(y), r12=78(width), r13=10(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 161
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 234
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 427
LDI r11, 26
LDI r12, 78
LDI r13, 10
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
