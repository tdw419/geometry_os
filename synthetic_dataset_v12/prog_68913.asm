; DESCRIPTION: Draws a orange line from (457, 1) to (488, 109).
; PLAN: r0=457(x1), r1=1(y1), r2=488(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 1
LDI r2, 488
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
