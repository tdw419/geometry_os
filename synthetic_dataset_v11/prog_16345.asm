; DESCRIPTION: Renders a purple line between points (115, 177) and (98, 108).
; PLAN: r0=115(x1), r1=177(y1), r2=98(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 177
LDI r2, 98
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
