; DESCRIPTION: Renders a red line between points (169, 64) and (19, 18).
; PLAN: r0=169(x1), r1=64(y1), r2=19(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 64
LDI r2, 19
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
