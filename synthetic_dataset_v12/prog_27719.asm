; DESCRIPTION: Renders a white line between points (85, 92) and (63, 216).
; PLAN: r0=85(x1), r1=92(y1), r2=63(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 92
LDI r2, 63
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
