; DESCRIPTION: Places a blue line segment connecting (481, 83) to (455, 117).
; PLAN: r0=481(x1), r1=83(y1), r2=455(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 83
LDI r2, 455
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
