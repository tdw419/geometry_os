; DESCRIPTION: Places a blue line segment connecting (300, 152) to (29, 207).
; PLAN: r0=300(x1), r1=152(y1), r2=29(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 152
LDI r2, 29
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
