; DESCRIPTION: Places a blue line segment connecting (303, 141) to (382, 65).
; PLAN: r0=303(x1), r1=141(y1), r2=382(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 141
LDI r2, 382
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
