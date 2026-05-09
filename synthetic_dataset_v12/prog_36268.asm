; DESCRIPTION: Composite: Renders a green disk with center (227, 157) and radius 26 then Renders a blue box of size 45x16 starting at (457, 22).
; PLAN: r0=227(x), r1=157(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=22(y), r7=45(width), r8=16(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 157
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 22
LDI r7, 45
LDI r8, 16
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
