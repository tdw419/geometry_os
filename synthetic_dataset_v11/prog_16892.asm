; DESCRIPTION: Draws a yellow line from (144, 40) to (209, 85).
; PLAN: r0=144(x1), r1=40(y1), r2=209(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 40
LDI r2, 209
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
