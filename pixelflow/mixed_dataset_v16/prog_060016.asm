; DESCRIPTION: Places a blue line segment connecting (158, 230) to (405, 180).
; PLAN: r0=158(x1), r1=230(y1), r2=405(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 230
LDI r2, 405
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
