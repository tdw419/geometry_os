; DESCRIPTION: Renders a yellow line between points (59, 191) and (219, 123).
; PLAN: r0=59(x1), r1=191(y1), r2=219(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 191
LDI r2, 219
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
