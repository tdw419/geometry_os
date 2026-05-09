; DESCRIPTION: Places a white line segment connecting (227, 230) to (12, 175).
; PLAN: r0=227(x1), r1=230(y1), r2=12(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 230
LDI r2, 12
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
