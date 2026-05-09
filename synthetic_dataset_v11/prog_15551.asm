; DESCRIPTION: Places a red line segment connecting (206, 97) to (219, 218).
; PLAN: r0=206(x1), r1=97(y1), r2=219(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 97
LDI r2, 219
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
