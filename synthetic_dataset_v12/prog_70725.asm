; DESCRIPTION: Renders a magenta line between points (426, 34) and (484, 120).
; PLAN: r0=426(x1), r1=34(y1), r2=484(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 34
LDI r2, 484
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
