; DESCRIPTION: Draws a black line from (476, 21) to (138, 144).
; PLAN: r0=476(x1), r1=21(y1), r2=138(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 21
LDI r2, 138
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
