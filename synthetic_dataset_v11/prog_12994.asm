; DESCRIPTION: Renders a black line between points (86, 59) and (170, 104).
; PLAN: r0=86(x1), r1=59(y1), r2=170(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 59
LDI r2, 170
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
