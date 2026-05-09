; DESCRIPTION: Places a blue line segment connecting (440, 135) to (35, 32).
; PLAN: r0=440(x1), r1=135(y1), r2=35(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 135
LDI r2, 35
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
