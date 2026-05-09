; DESCRIPTION: Composite: Creates a black circular shape at (186, 91) with radius 74 then Renders a red box of size 85x11 starting at (278, 62).
; PLAN: r0=186(x), r1=91(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=62(y), r7=85(width), r8=11(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 91
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 62
LDI r7, 85
LDI r8, 11
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
