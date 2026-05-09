; DESCRIPTION: Draws a yellow line from (144, 181) to (6, 186).
; PLAN: r0=144(x1), r1=181(y1), r2=6(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 181
LDI r2, 6
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
