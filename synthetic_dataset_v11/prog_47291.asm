; DESCRIPTION: Draws a black line from (47, 226) to (100, 63).
; PLAN: r0=47(x1), r1=226(y1), r2=100(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 226
LDI r2, 100
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
