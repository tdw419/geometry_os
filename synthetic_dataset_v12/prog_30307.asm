; DESCRIPTION: Composite: Creates a cyan rectangular region at (100, 16) spanning 101 by 11 pixels then Creates a red circular shape at (463, 157) with radius 31.
; PLAN: r0=100(x), r1=16(y), r2=101(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x), r6=157(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 100
LDI r1, 16
LDI r2, 101
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 157
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
