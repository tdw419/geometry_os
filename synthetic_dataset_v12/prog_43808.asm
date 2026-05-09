; DESCRIPTION: Places a blue line segment connecting (445, 192) to (40, 193).
; PLAN: r0=445(x1), r1=192(y1), r2=40(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 192
LDI r2, 40
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
