; DESCRIPTION: Places a blue line segment connecting (50, 61) to (477, 193).
; PLAN: r0=50(x1), r1=61(y1), r2=477(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 61
LDI r2, 477
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
