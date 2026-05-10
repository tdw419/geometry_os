; DESCRIPTION: Composite: Renders a black line between points (481, 78) and (211, 81) then Places a orange dot at position (241, 205).
; PLAN: r0=481(x1), r1=78(y1), r2=211(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=205(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 481
LDI r1, 78
LDI r2, 211
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 205
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
