; DESCRIPTION: Draws a blue line from (119, 152) to (381, 41).
; PLAN: r0=119(x1), r1=152(y1), r2=381(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 152
LDI r2, 381
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
