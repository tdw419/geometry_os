; DESCRIPTION: Draws a orange line from (24, 164) to (165, 230).
; PLAN: r0=24(x1), r1=164(y1), r2=165(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 164
LDI r2, 165
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
