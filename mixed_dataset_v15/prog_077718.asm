; DESCRIPTION: Draws a black line from (434, 114) to (389, 157).
; PLAN: r0=434(x1), r1=114(y1), r2=389(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 114
LDI r2, 389
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
