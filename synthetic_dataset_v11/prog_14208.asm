; DESCRIPTION: Draws a black line from (134, 5) to (144, 97).
; PLAN: r0=134(x1), r1=5(y1), r2=144(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 5
LDI r2, 144
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
