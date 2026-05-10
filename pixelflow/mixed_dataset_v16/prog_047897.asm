; DESCRIPTION: Composite: Places a purple 78x62 rectangle at position (100, 190) then Creates a red circular shape at (148, 158) with radius 60.
; PLAN: r0=100(x), r1=190(y), r2=78(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=158(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 100
LDI r1, 190
LDI r2, 78
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 158
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
