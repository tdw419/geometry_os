; DESCRIPTION: Renders a red line between points (484, 97) and (293, 183).
; PLAN: r0=484(x1), r1=97(y1), r2=293(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 97
LDI r2, 293
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
