; DESCRIPTION: Draws a purple line from (150, 234) to (210, 41).
; PLAN: r0=150(x1), r1=234(y1), r2=210(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 234
LDI r2, 210
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
