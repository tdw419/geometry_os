; DESCRIPTION: Draws a orange line from (487, 104) to (56, 88).
; PLAN: r0=487(x1), r1=104(y1), r2=56(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 104
LDI r2, 56
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
