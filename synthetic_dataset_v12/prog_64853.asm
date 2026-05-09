; DESCRIPTION: Draws a green line from (249, 244) to (451, 124).
; PLAN: r0=249(x1), r1=244(y1), r2=451(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 244
LDI r2, 451
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
