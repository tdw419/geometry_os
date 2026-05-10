; DESCRIPTION: Places a blue line segment connecting (477, 121) to (446, 115).
; PLAN: r0=477(x1), r1=121(y1), r2=446(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 121
LDI r2, 446
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
