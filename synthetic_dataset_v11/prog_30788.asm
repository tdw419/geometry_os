; DESCRIPTION: Places a blue line segment connecting (94, 127) to (108, 177).
; PLAN: r0=94(x1), r1=127(y1), r2=108(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 127
LDI r2, 108
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
