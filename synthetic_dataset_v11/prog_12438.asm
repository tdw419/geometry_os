; DESCRIPTION: Places a white line segment connecting (44, 61) to (72, 177).
; PLAN: r0=44(x1), r1=61(y1), r2=72(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 61
LDI r2, 72
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
