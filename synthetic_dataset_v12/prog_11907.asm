; DESCRIPTION: Places a red line segment connecting (124, 18) to (416, 62).
; PLAN: r0=124(x1), r1=18(y1), r2=416(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 18
LDI r2, 416
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
