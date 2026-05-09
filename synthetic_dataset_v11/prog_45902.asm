; DESCRIPTION: Draws a orange line from (61, 164) to (197, 1).
; PLAN: r0=61(x1), r1=164(y1), r2=197(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 164
LDI r2, 197
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
