; DESCRIPTION: Composite: Creates a red rectangular region at (129, 24) spanning 25 by 117 pixels then Sets a single yellow pixel at (402, 108) then Places a white circle of radius 73 at center (234, 179).
; PLAN: r0=129(x), r1=24(y), r2=25(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=108(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=234(x), r11=179(y), r12=73(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 24
LDI r2, 25
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 108
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 234
LDI r11, 179
LDI r12, 73
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
