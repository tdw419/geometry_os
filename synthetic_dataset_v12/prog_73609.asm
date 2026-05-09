; DESCRIPTION: Renders a red line between points (56, 146) and (223, 194).
; PLAN: r0=56(x1), r1=146(y1), r2=223(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 146
LDI r2, 223
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
