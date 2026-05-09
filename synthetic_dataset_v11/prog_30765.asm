; DESCRIPTION: Places a blue line segment connecting (14, 50) to (232, 126).
; PLAN: r0=14(x1), r1=50(y1), r2=232(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 50
LDI r2, 232
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
