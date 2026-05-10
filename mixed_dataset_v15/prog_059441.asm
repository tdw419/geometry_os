; DESCRIPTION: Draws a yellow line from (416, 87) to (5, 136).
; PLAN: r0=416(x1), r1=87(y1), r2=5(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 87
LDI r2, 5
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
