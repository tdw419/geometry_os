; DESCRIPTION: Draws a blue line from (192, 26) to (260, 165).
; PLAN: r0=192(x1), r1=26(y1), r2=260(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 26
LDI r2, 260
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
