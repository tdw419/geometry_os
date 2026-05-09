; DESCRIPTION: Draws a orange line from (95, 214) to (28, 197).
; PLAN: r0=95(x1), r1=214(y1), r2=28(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 214
LDI r2, 28
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
