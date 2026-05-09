; DESCRIPTION: Draws a black line from (447, 119) to (384, 226).
; PLAN: r0=447(x1), r1=119(y1), r2=384(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 119
LDI r2, 384
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
