; DESCRIPTION: Composite: Creates a yellow circular shape at (463, 51) with radius 31 then Renders a black box of size 21x116 starting at (477, 100).
; PLAN: r0=463(x), r1=51(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x), r6=100(y), r7=21(width), r8=116(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 51
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 100
LDI r7, 21
LDI r8, 116
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
