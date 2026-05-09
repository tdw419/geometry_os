; DESCRIPTION: Draws a black line from (155, 81) to (40, 113).
; PLAN: r0=155(x1), r1=81(y1), r2=40(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 81
LDI r2, 40
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
