; DESCRIPTION: Places a white line segment connecting (461, 163) to (421, 169).
; PLAN: r0=461(x1), r1=163(y1), r2=421(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 163
LDI r2, 421
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
