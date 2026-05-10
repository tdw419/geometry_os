; DESCRIPTION: Places a orange line segment connecting (488, 165) to (14, 66).
; PLAN: r0=488(x1), r1=165(y1), r2=14(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 165
LDI r2, 14
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
