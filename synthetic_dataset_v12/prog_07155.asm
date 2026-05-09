; DESCRIPTION: Places a blue line segment connecting (118, 69) to (205, 5).
; PLAN: r0=118(x1), r1=69(y1), r2=205(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 69
LDI r2, 205
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
