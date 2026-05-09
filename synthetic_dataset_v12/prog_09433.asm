; DESCRIPTION: Draws a black line from (163, 150) to (117, 248).
; PLAN: r0=163(x1), r1=150(y1), r2=117(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 150
LDI r2, 117
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
