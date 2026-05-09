; DESCRIPTION: Renders a orange line between points (186, 92) and (141, 174).
; PLAN: r0=186(x1), r1=92(y1), r2=141(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 92
LDI r2, 141
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
