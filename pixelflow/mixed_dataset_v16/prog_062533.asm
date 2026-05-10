; DESCRIPTION: Composite: Renders a black box of size 76x13 starting at (199, 105) then Renders a orange disk with center (227, 150) and radius 68.
; PLAN: r0=199(x), r1=105(y), r2=76(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=150(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 199
LDI r1, 105
LDI r2, 76
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 150
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
