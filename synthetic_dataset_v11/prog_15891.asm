; DESCRIPTION: Places a black line segment connecting (138, 218) to (54, 29).
; PLAN: r0=138(x1), r1=218(y1), r2=54(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 218
LDI r2, 54
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
