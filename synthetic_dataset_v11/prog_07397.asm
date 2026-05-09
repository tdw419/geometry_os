; DESCRIPTION: Draws a black line from (233, 84) to (177, 206).
; PLAN: r0=233(x1), r1=84(y1), r2=177(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 84
LDI r2, 177
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
