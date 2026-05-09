; DESCRIPTION: Renders a red line between points (91, 184) and (233, 44).
; PLAN: r0=91(x1), r1=184(y1), r2=233(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 184
LDI r2, 233
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
