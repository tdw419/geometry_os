; DESCRIPTION: Places a white line segment connecting (191, 89) to (104, 28).
; PLAN: r0=191(x1), r1=89(y1), r2=104(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 89
LDI r2, 104
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
