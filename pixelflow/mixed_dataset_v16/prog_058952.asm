; DESCRIPTION: Renders a purple line between points (346, 89) and (212, 102).
; PLAN: r0=346(x1), r1=89(y1), r2=212(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 89
LDI r2, 212
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
