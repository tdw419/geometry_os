; DESCRIPTION: Places a white line segment connecting (423, 105) to (503, 144).
; PLAN: r0=423(x1), r1=105(y1), r2=503(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 105
LDI r2, 503
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
