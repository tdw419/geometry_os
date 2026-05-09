; DESCRIPTION: Draws a blue line from (100, 41) to (394, 188).
; PLAN: r0=100(x1), r1=41(y1), r2=394(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 41
LDI r2, 394
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
