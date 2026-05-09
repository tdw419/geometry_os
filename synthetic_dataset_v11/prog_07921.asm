; DESCRIPTION: Draws a black line from (110, 41) to (212, 240).
; PLAN: r0=110(x1), r1=41(y1), r2=212(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 41
LDI r2, 212
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
