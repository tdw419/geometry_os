; DESCRIPTION: Renders a red line between points (2, 73) and (211, 26).
; PLAN: r0=2(x1), r1=73(y1), r2=211(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 73
LDI r2, 211
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
