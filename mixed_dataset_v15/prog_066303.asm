; DESCRIPTION: Draws a orange line from (76, 133) to (37, 43).
; PLAN: r0=76(x1), r1=133(y1), r2=37(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 133
LDI r2, 37
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
