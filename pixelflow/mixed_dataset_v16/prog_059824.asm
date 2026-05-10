; DESCRIPTION: Draws a black line from (241, 181) to (279, 248).
; PLAN: r0=241(x1), r1=181(y1), r2=279(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 181
LDI r2, 279
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
