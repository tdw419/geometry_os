; DESCRIPTION: Draws a blue line from (273, 97) to (20, 251).
; PLAN: r0=273(x1), r1=97(y1), r2=20(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 97
LDI r2, 20
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
