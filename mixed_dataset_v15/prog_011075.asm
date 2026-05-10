; DESCRIPTION: Places a white line segment connecting (505, 74) to (288, 18).
; PLAN: r0=505(x1), r1=74(y1), r2=288(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 74
LDI r2, 288
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
