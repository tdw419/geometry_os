; DESCRIPTION: Draws a black line from (471, 25) to (481, 160).
; PLAN: r0=471(x1), r1=25(y1), r2=481(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 25
LDI r2, 481
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
