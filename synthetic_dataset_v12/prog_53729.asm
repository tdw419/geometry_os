; DESCRIPTION: Draws a black line from (455, 217) to (276, 25).
; PLAN: r0=455(x1), r1=217(y1), r2=276(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 217
LDI r2, 276
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
