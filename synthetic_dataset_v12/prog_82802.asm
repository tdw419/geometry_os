; DESCRIPTION: Composite: Places a orange line segment connecting (76, 29) to (327, 222) then Sets a single yellow pixel at (354, 6).
; PLAN: r0=76(x1), r1=29(y1), r2=327(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=6(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 76
LDI r1, 29
LDI r2, 327
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 6
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
