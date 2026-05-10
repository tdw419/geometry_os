; DESCRIPTION: Composite: Creates a cyan rectangular region at (418, 69) spanning 84 by 115 pixels then Creates a purple circular shape at (368, 214) with radius 11.
; PLAN: r0=418(x), r1=69(y), r2=84(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=214(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 418
LDI r1, 69
LDI r2, 84
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 214
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
