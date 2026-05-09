; DESCRIPTION: Places a blue line segment connecting (393, 117) to (48, 163).
; PLAN: r0=393(x1), r1=117(y1), r2=48(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 117
LDI r2, 48
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
