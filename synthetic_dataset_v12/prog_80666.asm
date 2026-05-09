; DESCRIPTION: Places a blue line segment connecting (31, 180) to (73, 164).
; PLAN: r0=31(x1), r1=180(y1), r2=73(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 180
LDI r2, 73
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
