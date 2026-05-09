; DESCRIPTION: Renders a red line between points (141, 159) and (429, 212).
; PLAN: r0=141(x1), r1=159(y1), r2=429(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 159
LDI r2, 429
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
