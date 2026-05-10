; DESCRIPTION: Renders a black line between points (196, 100) and (192, 59).
; PLAN: r0=196(x1), r1=100(y1), r2=192(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 100
LDI r2, 192
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
