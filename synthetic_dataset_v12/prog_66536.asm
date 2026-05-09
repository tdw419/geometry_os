; DESCRIPTION: Renders a orange line between points (172, 82) and (92, 120).
; PLAN: r0=172(x1), r1=82(y1), r2=92(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 82
LDI r2, 92
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
