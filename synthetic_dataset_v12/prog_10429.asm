; DESCRIPTION: Draws a orange line from (176, 88) to (405, 6).
; PLAN: r0=176(x1), r1=88(y1), r2=405(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 88
LDI r2, 405
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
