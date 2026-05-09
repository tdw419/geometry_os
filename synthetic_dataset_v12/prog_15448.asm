; DESCRIPTION: Places a white line segment connecting (30, 101) to (247, 73).
; PLAN: r0=30(x1), r1=101(y1), r2=247(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 101
LDI r2, 247
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
