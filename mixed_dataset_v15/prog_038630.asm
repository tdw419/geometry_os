; DESCRIPTION: Places a white line segment connecting (124, 118) to (208, 132).
; PLAN: r0=124(x1), r1=118(y1), r2=208(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 118
LDI r2, 208
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
