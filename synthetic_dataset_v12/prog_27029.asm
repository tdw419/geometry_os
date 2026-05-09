; DESCRIPTION: Places a yellow line segment connecting (416, 120) to (229, 43).
; PLAN: r0=416(x1), r1=120(y1), r2=229(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 120
LDI r2, 229
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
