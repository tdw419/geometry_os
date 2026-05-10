; DESCRIPTION: Renders a black line between points (113, 240) and (55, 59).
; PLAN: r0=113(x1), r1=240(y1), r2=55(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 240
LDI r2, 55
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
