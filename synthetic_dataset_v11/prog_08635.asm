; DESCRIPTION: Renders a red line between points (244, 73) and (13, 13).
; PLAN: r0=244(x1), r1=73(y1), r2=13(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 73
LDI r2, 13
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
