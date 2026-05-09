; DESCRIPTION: Renders a red line between points (29, 244) and (106, 73).
; PLAN: r0=29(x1), r1=244(y1), r2=106(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 244
LDI r2, 106
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
