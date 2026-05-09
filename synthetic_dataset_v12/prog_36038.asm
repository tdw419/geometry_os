; DESCRIPTION: Places a blue line segment connecting (191, 173) to (84, 168).
; PLAN: r0=191(x1), r1=173(y1), r2=84(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 173
LDI r2, 84
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
