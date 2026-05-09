; DESCRIPTION: Places a black line segment connecting (416, 212) to (453, 207).
; PLAN: r0=416(x1), r1=212(y1), r2=453(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 212
LDI r2, 453
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
