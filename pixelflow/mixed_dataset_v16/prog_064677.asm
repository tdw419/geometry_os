; DESCRIPTION: Places a white line segment connecting (151, 14) to (129, 107).
; PLAN: r0=151(x1), r1=14(y1), r2=129(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 14
LDI r2, 129
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
