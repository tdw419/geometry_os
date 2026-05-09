; DESCRIPTION: Draws a black line from (197, 217) to (460, 49).
; PLAN: r0=197(x1), r1=217(y1), r2=460(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 217
LDI r2, 460
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
