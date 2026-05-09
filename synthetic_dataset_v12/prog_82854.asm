; DESCRIPTION: Composite: Places a red dot at position (137, 55) then Renders a blue line between points (149, 190) and (428, 144).
; PLAN: r0=137(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=149(x1), r6=190(y1), r7=428(x2), r8=144(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 55
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 149
LDI r6, 190
LDI r7, 428
LDI r8, 144
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
