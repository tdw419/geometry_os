; DESCRIPTION: Composite: Creates a yellow circular shape at (339, 87) with radius 77 then Places a red 116x80 rectangle at position (62, 135).
; PLAN: r0=339(x), r1=87(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x), r6=135(y), r7=116(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 87
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 135
LDI r7, 116
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
