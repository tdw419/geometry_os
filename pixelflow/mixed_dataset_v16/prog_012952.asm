; DESCRIPTION: Draws a yellow line from (220, 97) to (330, 3).
; PLAN: r0=220(x1), r1=97(y1), r2=330(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 97
LDI r2, 330
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
