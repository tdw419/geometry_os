; DESCRIPTION: Places a white line segment connecting (35, 3) to (416, 193).
; PLAN: r0=35(x1), r1=3(y1), r2=416(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 3
LDI r2, 416
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
