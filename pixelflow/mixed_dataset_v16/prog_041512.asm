; DESCRIPTION: Draws a yellow line from (280, 232) to (237, 140).
; PLAN: r0=280(x1), r1=232(y1), r2=237(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 232
LDI r2, 237
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
