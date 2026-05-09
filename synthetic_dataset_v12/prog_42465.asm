; DESCRIPTION: Places a black line segment connecting (84, 3) to (180, 47).
; PLAN: r0=84(x1), r1=3(y1), r2=180(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 3
LDI r2, 180
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
