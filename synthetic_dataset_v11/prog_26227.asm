; DESCRIPTION: Places a white line segment connecting (247, 81) to (88, 51).
; PLAN: r0=247(x1), r1=81(y1), r2=88(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 81
LDI r2, 88
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
