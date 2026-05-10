; DESCRIPTION: Renders a purple line between points (231, 24) and (313, 177).
; PLAN: r0=231(x1), r1=24(y1), r2=313(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 24
LDI r2, 313
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
