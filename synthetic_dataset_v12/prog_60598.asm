; DESCRIPTION: Renders a black line between points (415, 114) and (216, 168).
; PLAN: r0=415(x1), r1=114(y1), r2=216(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 114
LDI r2, 216
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
