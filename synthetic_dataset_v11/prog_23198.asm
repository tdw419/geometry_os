; DESCRIPTION: Draws a yellow line from (80, 232) to (49, 243).
; PLAN: r0=80(x1), r1=232(y1), r2=49(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 232
LDI r2, 49
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
