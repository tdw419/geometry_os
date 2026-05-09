; DESCRIPTION: Places a white line segment connecting (219, 250) to (10, 177).
; PLAN: r0=219(x1), r1=250(y1), r2=10(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 250
LDI r2, 10
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
