; DESCRIPTION: Renders a red line between points (367, 247) and (219, 223).
; PLAN: r0=367(x1), r1=247(y1), r2=219(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 247
LDI r2, 219
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
