; DESCRIPTION: Draws a blue line from (123, 203) to (21, 41).
; PLAN: r0=123(x1), r1=203(y1), r2=21(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 203
LDI r2, 21
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
