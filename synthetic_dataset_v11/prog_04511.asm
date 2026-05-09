; DESCRIPTION: Places a magenta line segment connecting (124, 115) to (104, 80).
; PLAN: r0=124(x1), r1=115(y1), r2=104(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 115
LDI r2, 104
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
