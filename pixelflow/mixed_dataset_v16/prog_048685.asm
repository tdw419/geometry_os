; DESCRIPTION: Places a blue line segment connecting (32, 126) to (20, 23).
; PLAN: r0=32(x1), r1=126(y1), r2=20(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 126
LDI r2, 20
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
