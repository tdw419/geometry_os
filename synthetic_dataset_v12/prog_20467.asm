; DESCRIPTION: Draws a yellow line from (505, 59) to (140, 110).
; PLAN: r0=505(x1), r1=59(y1), r2=140(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 59
LDI r2, 140
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
