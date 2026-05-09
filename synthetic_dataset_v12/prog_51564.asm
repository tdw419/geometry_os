; DESCRIPTION: Renders a red line between points (227, 33) and (183, 66).
; PLAN: r0=227(x1), r1=33(y1), r2=183(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 33
LDI r2, 183
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
