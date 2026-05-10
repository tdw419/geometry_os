; DESCRIPTION: Composite: Renders a green box of size 95x52 starting at (184, 12) then Creates a white circular shape at (423, 114) with radius 46.
; PLAN: r0=184(x), r1=12(y), r2=95(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=114(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 184
LDI r1, 12
LDI r2, 95
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 114
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
