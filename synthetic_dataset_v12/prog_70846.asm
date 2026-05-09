; DESCRIPTION: Composite: Places a yellow line segment connecting (490, 106) to (180, 185) then Places a cyan dot at position (369, 137).
; PLAN: r0=490(x1), r1=106(y1), r2=180(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=137(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 490
LDI r1, 106
LDI r2, 180
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 137
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
