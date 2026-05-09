; DESCRIPTION: Places a blue line segment connecting (96, 233) to (299, 46).
; PLAN: r0=96(x1), r1=233(y1), r2=299(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 233
LDI r2, 299
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
