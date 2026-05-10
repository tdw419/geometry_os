; DESCRIPTION: Composite: Creates a purple rectangular region at (254, 32) spanning 14 by 38 pixels then Places a black circle of radius 33 at center (279, 217).
; PLAN: r0=254(x), r1=32(y), r2=14(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x), r6=217(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 254
LDI r1, 32
LDI r2, 14
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 217
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
