; DESCRIPTION: Draws a black line from (151, 136) to (219, 93).
; PLAN: r0=151(x1), r1=136(y1), r2=219(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 136
LDI r2, 219
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
