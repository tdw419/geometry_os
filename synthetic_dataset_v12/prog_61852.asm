; DESCRIPTION: Places a yellow line segment connecting (481, 117) to (326, 127).
; PLAN: r0=481(x1), r1=117(y1), r2=326(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 117
LDI r2, 326
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
