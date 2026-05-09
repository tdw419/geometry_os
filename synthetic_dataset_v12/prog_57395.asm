; DESCRIPTION: Composite: Creates a yellow circular shape at (484, 85) with radius 25 then Renders a green box of size 92x89 starting at (163, 95).
; PLAN: r0=484(x), r1=85(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=95(y), r7=92(width), r8=89(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 85
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 95
LDI r7, 92
LDI r8, 89
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
