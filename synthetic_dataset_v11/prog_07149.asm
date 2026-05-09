; DESCRIPTION: Places a white line segment connecting (222, 25) to (241, 218).
; PLAN: r0=222(x1), r1=25(y1), r2=241(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 25
LDI r2, 241
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
