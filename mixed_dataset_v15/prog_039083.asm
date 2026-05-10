; DESCRIPTION: Places a purple line segment connecting (416, 69) to (106, 68).
; PLAN: r0=416(x1), r1=69(y1), r2=106(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 69
LDI r2, 106
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
