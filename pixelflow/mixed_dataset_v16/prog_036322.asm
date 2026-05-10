; DESCRIPTION: Composite: Renders a cyan box of size 78x55 starting at (324, 95) then Renders a black disk with center (323, 80) and radius 78.
; PLAN: r0=324(x), r1=95(y), r2=78(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=80(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 324
LDI r1, 95
LDI r2, 78
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 80
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
