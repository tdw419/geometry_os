; DESCRIPTION: Composite: Renders a purple box of size 22x62 starting at (36, 14) then Sets a single red pixel at (304, 78).
; PLAN: r0=36(x), r1=14(y), r2=22(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=78(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 36
LDI r1, 14
LDI r2, 22
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 78
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
