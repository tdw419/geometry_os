; DESCRIPTION: Places a yellow line segment connecting (326, 108) to (50, 218).
; PLAN: r0=326(x1), r1=108(y1), r2=50(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 108
LDI r2, 50
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
