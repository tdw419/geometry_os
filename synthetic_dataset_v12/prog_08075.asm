; DESCRIPTION: Draws a yellow line from (310, 199) to (162, 84).
; PLAN: r0=310(x1), r1=199(y1), r2=162(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 199
LDI r2, 162
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
