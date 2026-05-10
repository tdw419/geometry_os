; DESCRIPTION: Draws a yellow line from (96, 147) to (213, 78).
; PLAN: r0=96(x1), r1=147(y1), r2=213(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 147
LDI r2, 213
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
