; DESCRIPTION: Places a blue line segment connecting (5, 205) to (400, 81).
; PLAN: r0=5(x1), r1=205(y1), r2=400(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 205
LDI r2, 400
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
