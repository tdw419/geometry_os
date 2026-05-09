; DESCRIPTION: Renders a orange line between points (79, 247) and (108, 202).
; PLAN: r0=79(x1), r1=247(y1), r2=108(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 247
LDI r2, 108
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
