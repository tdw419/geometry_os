; DESCRIPTION: Composite: Creates a yellow rectangular region at (296, 8) spanning 73 by 81 pixels then Creates a red circular shape at (394, 101) with radius 74.
; PLAN: r0=296(x), r1=8(y), r2=73(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=101(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 8
LDI r2, 73
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 101
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
