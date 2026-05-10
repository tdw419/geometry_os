; DESCRIPTION: Renders a orange line between points (83, 57) and (230, 218).
; PLAN: r0=83(x1), r1=57(y1), r2=230(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 57
LDI r2, 230
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
