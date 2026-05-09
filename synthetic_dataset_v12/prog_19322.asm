; DESCRIPTION: Renders a yellow line between points (149, 1) and (470, 59).
; PLAN: r0=149(x1), r1=1(y1), r2=470(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 1
LDI r2, 470
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
