; DESCRIPTION: Renders a black line between points (212, 68) and (59, 230).
; PLAN: r0=212(x1), r1=68(y1), r2=59(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 68
LDI r2, 59
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
