; DESCRIPTION: Draws a black line from (38, 49) to (114, 79).
; PLAN: r0=38(x1), r1=49(y1), r2=114(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 49
LDI r2, 114
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
