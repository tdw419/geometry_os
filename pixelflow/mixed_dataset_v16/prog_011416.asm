; DESCRIPTION: Composite: Sets a single cyan pixel at (78, 22) then Renders a cyan box of size 100x118 starting at (320, 22).
; PLAN: r0=78(x), r1=22(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=22(y), r7=100(width), r8=118(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 22
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 22
LDI r7, 100
LDI r8, 118
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
