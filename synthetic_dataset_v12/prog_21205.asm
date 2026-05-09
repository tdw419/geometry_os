; DESCRIPTION: Renders a red line between points (194, 105) and (307, 207).
; PLAN: r0=194(x1), r1=105(y1), r2=307(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 105
LDI r2, 307
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
