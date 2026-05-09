; DESCRIPTION: Renders a black line between points (59, 139) and (59, 124).
; PLAN: r0=59(x1), r1=139(y1), r2=59(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 139
LDI r2, 59
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
