; DESCRIPTION: Composite: Places a red dot at position (269, 84) then Renders a purple line between points (80, 185) and (145, 1).
; PLAN: r0=269(x), r1=84(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=185(y1), r7=145(x2), r8=1(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 84
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 80
LDI r6, 185
LDI r7, 145
LDI r8, 1
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
