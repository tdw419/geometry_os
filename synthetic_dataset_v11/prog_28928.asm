; DESCRIPTION: Renders a black line between points (81, 59) and (111, 216).
; PLAN: r0=81(x1), r1=59(y1), r2=111(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 59
LDI r2, 111
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
