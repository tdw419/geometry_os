; DESCRIPTION: Places a blue line segment connecting (207, 37) to (39, 216).
; PLAN: r0=207(x1), r1=37(y1), r2=39(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 37
LDI r2, 39
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
