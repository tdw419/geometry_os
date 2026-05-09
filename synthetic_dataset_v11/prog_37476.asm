; DESCRIPTION: Draws a green line from (136, 218) to (249, 26).
; PLAN: r0=136(x1), r1=218(y1), r2=249(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 218
LDI r2, 249
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
