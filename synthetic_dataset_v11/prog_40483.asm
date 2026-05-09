; DESCRIPTION: Places a red line segment connecting (219, 62) to (218, 29).
; PLAN: r0=219(x1), r1=62(y1), r2=218(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 62
LDI r2, 218
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
