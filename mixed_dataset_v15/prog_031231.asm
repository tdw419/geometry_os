; DESCRIPTION: Places a blue line segment connecting (385, 11) to (392, 149).
; PLAN: r0=385(x1), r1=11(y1), r2=392(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 11
LDI r2, 392
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
