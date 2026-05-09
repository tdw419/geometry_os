; DESCRIPTION: Renders a black line between points (454, 59) and (216, 108).
; PLAN: r0=454(x1), r1=59(y1), r2=216(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 59
LDI r2, 216
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
