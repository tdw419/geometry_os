; DESCRIPTION: Places a blue line segment connecting (152, 45) to (382, 230).
; PLAN: r0=152(x1), r1=45(y1), r2=382(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 45
LDI r2, 382
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
