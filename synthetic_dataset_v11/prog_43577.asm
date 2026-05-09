; DESCRIPTION: Places a white line segment connecting (112, 44) to (74, 22).
; PLAN: r0=112(x1), r1=44(y1), r2=74(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 44
LDI r2, 74
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
