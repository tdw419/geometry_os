; DESCRIPTION: Renders a purple line between points (221, 100) and (433, 143).
; PLAN: r0=221(x1), r1=100(y1), r2=433(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 100
LDI r2, 433
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
