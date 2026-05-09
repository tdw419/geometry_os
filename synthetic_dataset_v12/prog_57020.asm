; DESCRIPTION: Draws a blue line from (65, 191) to (435, 248).
; PLAN: r0=65(x1), r1=191(y1), r2=435(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 191
LDI r2, 435
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
