; DESCRIPTION: Places a blue line segment connecting (450, 61) to (16, 230).
; PLAN: r0=450(x1), r1=61(y1), r2=16(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 61
LDI r2, 16
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
