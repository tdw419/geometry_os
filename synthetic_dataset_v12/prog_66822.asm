; DESCRIPTION: Renders a yellow line between points (337, 230) and (270, 218).
; PLAN: r0=337(x1), r1=230(y1), r2=270(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 230
LDI r2, 270
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
