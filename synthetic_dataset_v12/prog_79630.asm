; DESCRIPTION: Renders a red line between points (61, 73) and (260, 43).
; PLAN: r0=61(x1), r1=73(y1), r2=260(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 73
LDI r2, 260
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
