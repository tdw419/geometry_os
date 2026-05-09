; DESCRIPTION: Draws a yellow line from (206, 80) to (140, 22).
; PLAN: r0=206(x1), r1=80(y1), r2=140(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 80
LDI r2, 140
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
