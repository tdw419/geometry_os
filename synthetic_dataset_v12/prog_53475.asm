; DESCRIPTION: Renders a white line between points (487, 100) and (477, 1).
; PLAN: r0=487(x1), r1=100(y1), r2=477(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 100
LDI r2, 477
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
