; DESCRIPTION: Composite: Places a yellow line segment connecting (68, 131) to (299, 18) then Places a orange dot at position (339, 6).
; PLAN: r0=68(x1), r1=131(y1), r2=299(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=6(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 68
LDI r1, 131
LDI r2, 299
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 6
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
