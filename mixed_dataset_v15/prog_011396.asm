; DESCRIPTION: Places a orange line segment connecting (155, 21) to (488, 160).
; PLAN: r0=155(x1), r1=21(y1), r2=488(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 21
LDI r2, 488
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
