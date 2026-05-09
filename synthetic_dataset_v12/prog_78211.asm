; DESCRIPTION: Renders a red line between points (244, 8) and (414, 71).
; PLAN: r0=244(x1), r1=8(y1), r2=414(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 8
LDI r2, 414
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
