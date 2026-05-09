; DESCRIPTION: Renders a black line between points (247, 232) and (59, 240).
; PLAN: r0=247(x1), r1=232(y1), r2=59(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 232
LDI r2, 59
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
