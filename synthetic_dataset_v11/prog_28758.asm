; DESCRIPTION: Renders a red line between points (188, 62) and (98, 33).
; PLAN: r0=188(x1), r1=62(y1), r2=98(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 62
LDI r2, 98
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
