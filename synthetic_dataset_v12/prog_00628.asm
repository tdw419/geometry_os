; DESCRIPTION: Renders a red line between points (31, 171) and (34, 98).
; PLAN: r0=31(x1), r1=171(y1), r2=34(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 171
LDI r2, 34
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
