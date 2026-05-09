; DESCRIPTION: Renders a orange line between points (488, 7) and (244, 37).
; PLAN: r0=488(x1), r1=7(y1), r2=244(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 7
LDI r2, 244
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
