; DESCRIPTION: Renders a yellow line between points (185, 16) and (216, 244).
; PLAN: r0=185(x1), r1=16(y1), r2=216(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 16
LDI r2, 216
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
