; DESCRIPTION: Places a white line segment connecting (233, 70) to (216, 196).
; PLAN: r0=233(x1), r1=70(y1), r2=216(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 70
LDI r2, 216
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
