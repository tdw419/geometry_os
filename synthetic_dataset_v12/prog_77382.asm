; DESCRIPTION: Renders a red line between points (98, 12) and (211, 244).
; PLAN: r0=98(x1), r1=12(y1), r2=211(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 12
LDI r2, 211
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
