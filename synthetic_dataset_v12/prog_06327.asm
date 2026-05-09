; DESCRIPTION: Places a blue line segment connecting (155, 27) to (401, 45).
; PLAN: r0=155(x1), r1=27(y1), r2=401(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 27
LDI r2, 401
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
