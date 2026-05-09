; DESCRIPTION: Renders a white line between points (10, 133) and (78, 19).
; PLAN: r0=10(x1), r1=133(y1), r2=78(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 133
LDI r2, 78
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
