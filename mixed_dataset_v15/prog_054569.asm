; DESCRIPTION: Composite: Renders a blue line between points (496, 39) and (43, 109) then Sets a single cyan pixel at (72, 2).
; PLAN: r0=496(x1), r1=39(y1), r2=43(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=2(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 496
LDI r1, 39
LDI r2, 43
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 2
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
