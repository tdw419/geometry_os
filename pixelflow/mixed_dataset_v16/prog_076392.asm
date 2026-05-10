; DESCRIPTION: Draws a black line from (426, 79) to (411, 155).
; PLAN: r0=426(x1), r1=79(y1), r2=411(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 79
LDI r2, 411
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
