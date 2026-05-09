; DESCRIPTION: Composite: Renders a white box of size 91x74 starting at (136, 176) then Renders a orange disk with center (363, 85) and radius 54.
; PLAN: r0=136(x), r1=176(y), r2=91(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=85(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 176
LDI r2, 91
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 85
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
