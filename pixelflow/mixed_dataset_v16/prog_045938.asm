; DESCRIPTION: Renders a green line between points (498, 59) and (163, 85).
; PLAN: r0=498(x1), r1=59(y1), r2=163(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 59
LDI r2, 163
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
