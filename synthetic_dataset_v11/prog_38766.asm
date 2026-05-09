; DESCRIPTION: Renders a blue line between points (175, 191) and (21, 244).
; PLAN: r0=175(x1), r1=191(y1), r2=21(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 191
LDI r2, 21
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
