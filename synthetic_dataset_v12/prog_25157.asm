; DESCRIPTION: Renders a green line between points (348, 89) and (45, 6).
; PLAN: r0=348(x1), r1=89(y1), r2=45(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 89
LDI r2, 45
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
