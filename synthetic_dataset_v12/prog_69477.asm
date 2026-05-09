; DESCRIPTION: Draws a orange line from (76, 11) to (258, 29).
; PLAN: r0=76(x1), r1=11(y1), r2=258(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 11
LDI r2, 258
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
