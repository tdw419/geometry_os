; DESCRIPTION: Places a white line segment connecting (70, 20) to (22, 73).
; PLAN: r0=70(x1), r1=20(y1), r2=22(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 20
LDI r2, 22
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
