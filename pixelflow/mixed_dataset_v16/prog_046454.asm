; DESCRIPTION: Composite: Places a red 51x106 rectangle at position (361, 78) then Creates a purple circular shape at (370, 135) with radius 64.
; PLAN: r0=361(x), r1=78(y), r2=51(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=135(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 361
LDI r1, 78
LDI r2, 51
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 135
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
