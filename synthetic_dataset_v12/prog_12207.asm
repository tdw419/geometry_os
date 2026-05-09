; DESCRIPTION: Renders a orange line between points (1, 187) and (488, 207).
; PLAN: r0=1(x1), r1=187(y1), r2=488(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 187
LDI r2, 488
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
