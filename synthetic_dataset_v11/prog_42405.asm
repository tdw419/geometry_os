; DESCRIPTION: Places a blue line segment connecting (127, 176) to (205, 53).
; PLAN: r0=127(x1), r1=176(y1), r2=205(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 176
LDI r2, 205
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
