; DESCRIPTION: Composite: Renders a black line between points (132, 114) and (315, 85) then Places a red dot at position (75, 177).
; PLAN: r0=132(x1), r1=114(y1), r2=315(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=177(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 132
LDI r1, 114
LDI r2, 315
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 177
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
