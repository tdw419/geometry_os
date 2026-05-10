; DESCRIPTION: Composite: Places a purple dot at position (139, 68) then Renders a red box of size 20x79 starting at (278, 79).
; PLAN: r0=139(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=79(y), r7=20(width), r8=79(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 68
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 79
LDI r7, 20
LDI r8, 79
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
