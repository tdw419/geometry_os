; DESCRIPTION: Composite: Renders a black line between points (22, 182) and (26, 101) then Places a orange dot at position (287, 194).
; PLAN: r0=22(x1), r1=182(y1), r2=26(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=194(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 22
LDI r1, 182
LDI r2, 26
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 194
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
