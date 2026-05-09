; DESCRIPTION: Renders a black line between points (337, 217) and (259, 168).
; PLAN: r0=337(x1), r1=217(y1), r2=259(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 217
LDI r2, 259
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
