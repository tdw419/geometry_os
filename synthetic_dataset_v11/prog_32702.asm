; DESCRIPTION: Places a white line segment connecting (51, 182) to (56, 72).
; PLAN: r0=51(x1), r1=182(y1), r2=56(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 182
LDI r2, 56
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
