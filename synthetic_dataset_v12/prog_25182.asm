; DESCRIPTION: Renders a red line between points (305, 214) and (451, 218).
; PLAN: r0=305(x1), r1=214(y1), r2=451(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 214
LDI r2, 451
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
