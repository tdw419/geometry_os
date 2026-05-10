; DESCRIPTION: Composite: Creates a purple circular shape at (105, 109) with radius 73 then Creates a black rectangular region at (63, 171) spanning 51 by 72 pixels.
; PLAN: r0=105(x), r1=109(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=171(y), r7=51(width), r8=72(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 109
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 171
LDI r7, 51
LDI r8, 72
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
