; DESCRIPTION: Places a blue line segment connecting (57, 214) to (60, 207).
; PLAN: r0=57(x1), r1=214(y1), r2=60(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 214
LDI r2, 60
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
