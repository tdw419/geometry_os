; DESCRIPTION: Places a black line segment connecting (396, 252) to (488, 79).
; PLAN: r0=396(x1), r1=252(y1), r2=488(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 252
LDI r2, 488
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
