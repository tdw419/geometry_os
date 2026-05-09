; DESCRIPTION: Places a blue line segment connecting (184, 254) to (380, 218).
; PLAN: r0=184(x1), r1=254(y1), r2=380(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 254
LDI r2, 380
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
