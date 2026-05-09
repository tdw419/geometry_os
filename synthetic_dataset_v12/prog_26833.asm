; DESCRIPTION: Composite: Renders a red box of size 38x89 starting at (247, 148) then Places a white circle of radius 26 at center (463, 75).
; PLAN: r0=247(x), r1=148(y), r2=38(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x), r6=75(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 148
LDI r2, 38
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 75
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
