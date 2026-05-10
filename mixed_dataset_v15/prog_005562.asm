; DESCRIPTION: Places a purple line segment connecting (481, 231) to (452, 99).
; PLAN: r0=481(x1), r1=231(y1), r2=452(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 231
LDI r2, 452
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
