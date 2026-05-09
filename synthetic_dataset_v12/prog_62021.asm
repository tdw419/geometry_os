; DESCRIPTION: Composite: Places a purple dot at position (10, 194) then Renders a red box of size 109x118 starting at (90, 131).
; PLAN: r0=10(x), r1=194(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=131(y), r7=109(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 194
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 131
LDI r7, 109
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
