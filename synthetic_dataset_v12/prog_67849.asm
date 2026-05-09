; DESCRIPTION: Draws a orange line from (252, 139) to (492, 198).
; PLAN: r0=252(x1), r1=139(y1), r2=492(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 139
LDI r2, 492
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
