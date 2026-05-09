; DESCRIPTION: Composite: Renders a red line between points (490, 181) and (141, 231) then Sets a single cyan pixel at (105, 142).
; PLAN: r0=490(x1), r1=181(y1), r2=141(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=142(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 490
LDI r1, 181
LDI r2, 141
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 142
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
