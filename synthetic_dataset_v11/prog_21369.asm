; DESCRIPTION: Renders a red line between points (54, 87) and (189, 193).
; PLAN: r0=54(x1), r1=87(y1), r2=189(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 87
LDI r2, 189
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
