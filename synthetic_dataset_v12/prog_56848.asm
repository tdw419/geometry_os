; DESCRIPTION: Places a white line segment connecting (208, 177) to (49, 20).
; PLAN: r0=208(x1), r1=177(y1), r2=49(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 177
LDI r2, 49
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
