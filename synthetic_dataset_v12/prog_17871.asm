; DESCRIPTION: Composite: Renders a green disk with center (418, 158) and radius 75 then Renders a black box of size 100x63 starting at (158, 57).
; PLAN: r0=418(x), r1=158(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=57(y), r7=100(width), r8=63(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 158
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 57
LDI r7, 100
LDI r8, 63
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
