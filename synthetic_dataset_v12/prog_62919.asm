; DESCRIPTION: Places a white line segment connecting (4, 40) to (356, 241).
; PLAN: r0=4(x1), r1=40(y1), r2=356(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 40
LDI r2, 356
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
