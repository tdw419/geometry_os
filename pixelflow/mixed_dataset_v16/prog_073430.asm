; DESCRIPTION: Places a blue line segment connecting (230, 47) to (35, 202).
; PLAN: r0=230(x1), r1=47(y1), r2=35(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 47
LDI r2, 35
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
