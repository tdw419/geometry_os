; DESCRIPTION: Places a white line segment connecting (35, 162) to (202, 227).
; PLAN: r0=35(x1), r1=162(y1), r2=202(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 162
LDI r2, 202
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
