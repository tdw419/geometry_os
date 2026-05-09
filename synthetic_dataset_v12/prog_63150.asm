; DESCRIPTION: Composite: Sets a single yellow pixel at (252, 232) then Renders a green box of size 101x118 starting at (352, 122).
; PLAN: r0=252(x), r1=232(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=122(y), r7=101(width), r8=118(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 232
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 352
LDI r6, 122
LDI r7, 101
LDI r8, 118
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
