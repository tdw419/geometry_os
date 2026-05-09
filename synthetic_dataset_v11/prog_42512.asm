; DESCRIPTION: Draws a orange line from (104, 56) to (191, 237).
; PLAN: r0=104(x1), r1=56(y1), r2=191(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 56
LDI r2, 191
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
