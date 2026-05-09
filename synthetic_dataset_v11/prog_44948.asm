; DESCRIPTION: Draws a yellow line from (96, 97) to (89, 142).
; PLAN: r0=96(x1), r1=97(y1), r2=89(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 97
LDI r2, 89
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
