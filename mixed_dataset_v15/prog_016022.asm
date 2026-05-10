; DESCRIPTION: Composite: Sets a single yellow pixel at (100, 14) then Places a green line segment connecting (291, 192) to (265, 252).
; PLAN: r0=100(x), r1=14(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=291(x1), r6=192(y1), r7=265(x2), r8=252(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 14
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 291
LDI r6, 192
LDI r7, 265
LDI r8, 252
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
