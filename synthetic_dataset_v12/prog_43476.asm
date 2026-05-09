; DESCRIPTION: Composite: Places a orange 88x98 rectangle at position (158, 100) then Sets a single red pixel at (37, 250).
; PLAN: r0=158(x), r1=100(y), r2=88(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x), r6=250(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 100
LDI r2, 88
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 250
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
