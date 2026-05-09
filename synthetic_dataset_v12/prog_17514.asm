; DESCRIPTION: Renders a red line between points (142, 178) and (223, 102).
; PLAN: r0=142(x1), r1=178(y1), r2=223(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 178
LDI r2, 223
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
