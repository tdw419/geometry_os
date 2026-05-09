; DESCRIPTION: Renders a black line between points (101, 225) and (186, 59).
; PLAN: r0=101(x1), r1=225(y1), r2=186(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 225
LDI r2, 186
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
