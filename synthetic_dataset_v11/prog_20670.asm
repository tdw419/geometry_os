; DESCRIPTION: Places a blue line segment connecting (39, 150) to (23, 59).
; PLAN: r0=39(x1), r1=150(y1), r2=23(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 150
LDI r2, 23
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
