; DESCRIPTION: Composite: Draws a orange line from (283, 40) to (373, 37) then Sets a single blue pixel at (138, 73).
; PLAN: r0=283(x1), r1=40(y1), r2=373(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=73(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 283
LDI r1, 40
LDI r2, 373
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 73
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
