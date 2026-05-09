; DESCRIPTION: Composite: Creates a yellow rectangular region at (201, 103) spanning 19 by 75 pixels then Creates a red circular shape at (81, 193) with radius 19.
; PLAN: r0=201(x), r1=103(y), r2=19(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=193(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 103
LDI r2, 19
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 193
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
