; DESCRIPTION: Places a yellow line segment connecting (304, 213) to (78, 218).
; PLAN: r0=304(x1), r1=213(y1), r2=78(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 213
LDI r2, 78
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
