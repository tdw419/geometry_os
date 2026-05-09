; DESCRIPTION: Places a blue line segment connecting (413, 129) to (134, 230).
; PLAN: r0=413(x1), r1=129(y1), r2=134(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 129
LDI r2, 134
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
