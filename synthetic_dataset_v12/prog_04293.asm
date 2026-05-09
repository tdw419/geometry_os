; DESCRIPTION: Places a blue line segment connecting (262, 20) to (472, 107).
; PLAN: r0=262(x1), r1=20(y1), r2=472(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 20
LDI r2, 472
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
