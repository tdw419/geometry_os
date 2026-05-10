; DESCRIPTION: Composite: Sets a single blue pixel at (172, 115) then Renders a orange box of size 64x118 starting at (205, 78).
; PLAN: r0=172(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=78(y), r7=64(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 205
LDI r6, 78
LDI r7, 64
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
