; DESCRIPTION: Draws a yellow line from (505, 141) to (506, 12).
; PLAN: r0=505(x1), r1=141(y1), r2=506(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 141
LDI r2, 506
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
