; DESCRIPTION: Renders a purple line between points (457, 206) and (305, 98).
; PLAN: r0=457(x1), r1=206(y1), r2=305(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 206
LDI r2, 305
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
