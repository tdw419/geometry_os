; DESCRIPTION: Places a blue line segment connecting (480, 124) to (458, 118).
; PLAN: r0=480(x1), r1=124(y1), r2=458(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 124
LDI r2, 458
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
