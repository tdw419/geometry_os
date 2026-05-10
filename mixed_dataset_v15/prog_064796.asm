; DESCRIPTION: Composite: Places a orange line segment connecting (449, 26) to (92, 170) then Sets a single blue pixel at (376, 198).
; PLAN: r0=449(x1), r1=26(y1), r2=92(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=198(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 449
LDI r1, 26
LDI r2, 92
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 198
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
