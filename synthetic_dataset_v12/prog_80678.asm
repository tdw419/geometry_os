; DESCRIPTION: Composite: Renders a cyan line between points (26, 242) and (145, 103) then Sets a single black pixel at (232, 15).
; PLAN: r0=26(x1), r1=242(y1), r2=145(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=15(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 26
LDI r1, 242
LDI r2, 145
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 15
LDI r7, 0x000000
PSET r5, r6, r7
HALT
