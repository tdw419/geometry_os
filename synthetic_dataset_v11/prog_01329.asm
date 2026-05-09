; DESCRIPTION: Renders a green line between points (233, 255) and (44, 216).
; PLAN: r0=233(x1), r1=255(y1), r2=44(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 255
LDI r2, 44
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
