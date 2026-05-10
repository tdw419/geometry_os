; DESCRIPTION: Places a blue line segment connecting (437, 42) to (348, 73).
; PLAN: r0=437(x1), r1=42(y1), r2=348(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 42
LDI r2, 348
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
