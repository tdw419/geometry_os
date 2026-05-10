; DESCRIPTION: Renders a yellow line between points (437, 12) and (464, 218).
; PLAN: r0=437(x1), r1=12(y1), r2=464(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 12
LDI r2, 464
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
