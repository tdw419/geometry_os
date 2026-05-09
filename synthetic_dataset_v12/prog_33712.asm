; DESCRIPTION: Renders a black line between points (191, 219) and (108, 59).
; PLAN: r0=191(x1), r1=219(y1), r2=108(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 219
LDI r2, 108
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
