; DESCRIPTION: Places a white line segment connecting (469, 112) to (290, 80).
; PLAN: r0=469(x1), r1=112(y1), r2=290(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 112
LDI r2, 290
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
