; DESCRIPTION: Places a blue line segment connecting (23, 20) to (32, 132).
; PLAN: r0=23(x1), r1=20(y1), r2=32(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 20
LDI r2, 32
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
