; DESCRIPTION: Places a white line segment connecting (169, 10) to (173, 251).
; PLAN: r0=169(x1), r1=10(y1), r2=173(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 10
LDI r2, 173
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
