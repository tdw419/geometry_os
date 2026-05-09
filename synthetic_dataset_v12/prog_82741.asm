; DESCRIPTION: Draws a green line from (139, 100) to (485, 13).
; PLAN: r0=139(x1), r1=100(y1), r2=485(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 100
LDI r2, 485
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
