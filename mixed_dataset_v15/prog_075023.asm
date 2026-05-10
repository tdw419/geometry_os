; DESCRIPTION: Composite: Places a purple dot at position (62, 162) then Renders a red box of size 115x110 starting at (131, 105).
; PLAN: r0=62(x), r1=162(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=105(y), r7=115(width), r8=110(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 162
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 105
LDI r7, 115
LDI r8, 110
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
