; DESCRIPTION: Places a blue line segment connecting (291, 212) to (500, 186).
; PLAN: r0=291(x1), r1=212(y1), r2=500(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 212
LDI r2, 500
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
