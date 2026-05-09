; DESCRIPTION: Draws a yellow line from (7, 120) to (155, 221).
; PLAN: r0=7(x1), r1=120(y1), r2=155(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 120
LDI r2, 155
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
