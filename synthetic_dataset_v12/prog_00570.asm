; DESCRIPTION: Composite: Creates a green circular shape at (138, 51) with radius 33 then Renders a white box of size 16x89 starting at (457, 153).
; PLAN: r0=138(x), r1=51(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=153(y), r7=16(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 51
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 153
LDI r7, 16
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
