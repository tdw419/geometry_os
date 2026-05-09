; DESCRIPTION: Renders a red line between points (156, 218) and (393, 98).
; PLAN: r0=156(x1), r1=218(y1), r2=393(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 218
LDI r2, 393
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
