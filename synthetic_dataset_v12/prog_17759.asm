; DESCRIPTION: Draws a orange line from (258, 63) to (243, 162).
; PLAN: r0=258(x1), r1=63(y1), r2=243(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 63
LDI r2, 243
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
