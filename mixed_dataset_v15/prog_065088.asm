; DESCRIPTION: Renders a magenta line between points (208, 77) and (348, 184).
; PLAN: r0=208(x1), r1=77(y1), r2=348(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 77
LDI r2, 348
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
