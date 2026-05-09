; DESCRIPTION: Renders a white line between points (316, 133) and (120, 168).
; PLAN: r0=316(x1), r1=133(y1), r2=120(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 133
LDI r2, 120
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
