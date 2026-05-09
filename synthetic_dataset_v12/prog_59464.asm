; DESCRIPTION: Renders a yellow line between points (436, 191) and (321, 249).
; PLAN: r0=436(x1), r1=191(y1), r2=321(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 191
LDI r2, 321
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
