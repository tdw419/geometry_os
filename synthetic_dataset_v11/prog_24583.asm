; DESCRIPTION: Places a white line segment connecting (34, 52) to (178, 196).
; PLAN: r0=34(x1), r1=52(y1), r2=178(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 52
LDI r2, 178
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
