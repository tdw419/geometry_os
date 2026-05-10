; DESCRIPTION: Renders a green line between points (348, 33) and (266, 40).
; PLAN: r0=348(x1), r1=33(y1), r2=266(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 33
LDI r2, 266
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
