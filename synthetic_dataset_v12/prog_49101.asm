; DESCRIPTION: Draws a blue line from (150, 41) to (150, 3).
; PLAN: r0=150(x1), r1=41(y1), r2=150(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 41
LDI r2, 150
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
