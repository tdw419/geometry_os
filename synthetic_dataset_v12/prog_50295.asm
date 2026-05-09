; DESCRIPTION: Composite: Renders a blue disk with center (259, 159) and radius 68 then Renders a cyan box of size 78x85 starting at (93, 54).
; PLAN: r0=259(x), r1=159(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=54(y), r7=78(width), r8=85(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 159
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 54
LDI r7, 78
LDI r8, 85
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
