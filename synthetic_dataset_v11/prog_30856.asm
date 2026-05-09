; DESCRIPTION: Renders a white line between points (124, 240) and (62, 206).
; PLAN: r0=124(x1), r1=240(y1), r2=62(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 240
LDI r2, 62
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
