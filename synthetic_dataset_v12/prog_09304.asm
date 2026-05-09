; DESCRIPTION: Renders a red line between points (448, 132) and (251, 151).
; PLAN: r0=448(x1), r1=132(y1), r2=251(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 132
LDI r2, 251
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
