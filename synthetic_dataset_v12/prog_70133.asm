; DESCRIPTION: Renders a white line between points (473, 116) and (377, 11).
; PLAN: r0=473(x1), r1=116(y1), r2=377(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 116
LDI r2, 377
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
