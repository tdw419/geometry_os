; DESCRIPTION: Places a blue line segment connecting (168, 218) to (311, 152).
; PLAN: r0=168(x1), r1=218(y1), r2=311(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 218
LDI r2, 311
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
