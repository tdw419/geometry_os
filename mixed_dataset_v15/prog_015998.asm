; DESCRIPTION: Places a blue line segment connecting (21, 162) to (405, 24).
; PLAN: r0=21(x1), r1=162(y1), r2=405(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 162
LDI r2, 405
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
