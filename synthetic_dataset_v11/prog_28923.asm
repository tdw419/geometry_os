; DESCRIPTION: Renders a black line between points (99, 193) and (108, 80).
; PLAN: r0=99(x1), r1=193(y1), r2=108(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 193
LDI r2, 108
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
