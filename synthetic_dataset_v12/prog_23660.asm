; DESCRIPTION: Draws a green line from (483, 191) to (192, 65).
; PLAN: r0=483(x1), r1=191(y1), r2=192(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 191
LDI r2, 192
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
