; DESCRIPTION: Draws a yellow line from (359, 195) to (205, 185).
; PLAN: r0=359(x1), r1=195(y1), r2=205(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 195
LDI r2, 205
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
