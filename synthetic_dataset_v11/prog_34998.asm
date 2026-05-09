; DESCRIPTION: Places a blue line segment connecting (171, 68) to (162, 193).
; PLAN: r0=171(x1), r1=68(y1), r2=162(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 68
LDI r2, 162
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
