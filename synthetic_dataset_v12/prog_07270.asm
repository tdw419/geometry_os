; DESCRIPTION: Renders a red line between points (390, 111) and (468, 143).
; PLAN: r0=390(x1), r1=111(y1), r2=468(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 111
LDI r2, 468
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
