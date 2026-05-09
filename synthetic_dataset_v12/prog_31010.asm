; DESCRIPTION: Composite: Renders a yellow line between points (389, 18) and (37, 82) then Places a black dot at position (161, 101).
; PLAN: r0=389(x1), r1=18(y1), r2=37(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=101(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 18
LDI r2, 37
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 101
LDI r7, 0x000000
PSET r5, r6, r7
HALT
