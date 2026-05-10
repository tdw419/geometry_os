; DESCRIPTION: Composite: Renders a green disk with center (86, 58) and radius 22 then Renders a blue box of size 26x74 starting at (110, 71).
; PLAN: r0=86(x), r1=58(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=110(x), r6=71(y), r7=26(width), r8=74(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 58
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 110
LDI r6, 71
LDI r7, 26
LDI r8, 74
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
