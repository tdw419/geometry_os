; DESCRIPTION: Composite: Renders a blue line between points (399, 2) and (458, 144) then Places a black dot at position (467, 88).
; PLAN: r0=399(x1), r1=2(y1), r2=458(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=88(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 2
LDI r2, 458
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 88
LDI r7, 0x000000
PSET r5, r6, r7
HALT
