; DESCRIPTION: Renders a red line between points (472, 82) and (114, 146).
; PLAN: r0=472(x1), r1=82(y1), r2=114(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 82
LDI r2, 114
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
