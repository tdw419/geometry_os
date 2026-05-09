; DESCRIPTION: Draws a orange line from (130, 92) to (237, 222).
; PLAN: r0=130(x1), r1=92(y1), r2=237(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 92
LDI r2, 237
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
