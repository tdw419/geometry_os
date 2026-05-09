; DESCRIPTION: Draws a black line from (132, 113) to (194, 12).
; PLAN: r0=132(x1), r1=113(y1), r2=194(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 113
LDI r2, 194
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
