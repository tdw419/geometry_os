; DESCRIPTION: Places a red line segment connecting (416, 123) to (188, 132).
; PLAN: r0=416(x1), r1=123(y1), r2=188(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 123
LDI r2, 188
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
