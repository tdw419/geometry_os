; DESCRIPTION: Draws a yellow line from (22, 195) to (63, 135).
; PLAN: r0=22(x1), r1=195(y1), r2=63(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 195
LDI r2, 63
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
