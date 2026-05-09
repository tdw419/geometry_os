; DESCRIPTION: Places a blue line segment connecting (6, 168) to (348, 138).
; PLAN: r0=6(x1), r1=168(y1), r2=348(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 168
LDI r2, 348
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
