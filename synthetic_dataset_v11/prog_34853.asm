; DESCRIPTION: Draws a orange line from (14, 240) to (121, 66).
; PLAN: r0=14(x1), r1=240(y1), r2=121(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 240
LDI r2, 121
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
