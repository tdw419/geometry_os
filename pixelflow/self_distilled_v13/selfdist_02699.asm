; DESCRIPTION: Draws a orange line from (49, 124) to (24, 98).
; PLAN: r0=49(x1), r1=124(y1), r2=24(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 124
LDI r2, 24
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
