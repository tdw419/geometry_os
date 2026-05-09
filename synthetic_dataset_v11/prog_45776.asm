; DESCRIPTION: Places a blue line segment connecting (69, 168) to (52, 165).
; PLAN: r0=69(x1), r1=168(y1), r2=52(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 168
LDI r2, 52
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
