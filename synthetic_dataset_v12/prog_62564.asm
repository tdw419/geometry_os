; DESCRIPTION: Renders a black line between points (196, 108) and (331, 98).
; PLAN: r0=196(x1), r1=108(y1), r2=331(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 108
LDI r2, 331
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
