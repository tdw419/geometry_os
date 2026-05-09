; DESCRIPTION: Renders a yellow line between points (378, 212) and (138, 218).
; PLAN: r0=378(x1), r1=212(y1), r2=138(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 212
LDI r2, 138
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
