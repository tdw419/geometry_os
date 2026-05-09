; DESCRIPTION: Renders a purple line between points (193, 187) and (44, 199).
; PLAN: r0=193(x1), r1=187(y1), r2=44(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 187
LDI r2, 44
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
