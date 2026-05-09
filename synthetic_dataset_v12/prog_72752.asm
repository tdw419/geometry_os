; DESCRIPTION: Renders a yellow line between points (389, 255) and (56, 31).
; PLAN: r0=389(x1), r1=255(y1), r2=56(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 255
LDI r2, 56
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
