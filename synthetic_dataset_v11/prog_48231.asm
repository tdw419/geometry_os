; DESCRIPTION: Places a white line segment connecting (148, 185) to (73, 10).
; PLAN: r0=148(x1), r1=185(y1), r2=73(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 185
LDI r2, 73
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
