; DESCRIPTION: Renders a red line between points (100, 97) and (221, 69).
; PLAN: r0=100(x1), r1=97(y1), r2=221(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 97
LDI r2, 221
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
