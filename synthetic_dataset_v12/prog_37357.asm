; DESCRIPTION: Composite: Places a black dot at position (241, 198) then Renders a purple line between points (507, 163) and (65, 76).
; PLAN: r0=241(x), r1=198(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=507(x1), r6=163(y1), r7=65(x2), r8=76(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 198
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 507
LDI r6, 163
LDI r7, 65
LDI r8, 76
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
