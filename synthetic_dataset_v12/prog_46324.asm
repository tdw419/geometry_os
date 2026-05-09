; DESCRIPTION: Draws a orange line from (137, 92) to (27, 234).
; PLAN: r0=137(x1), r1=92(y1), r2=27(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 92
LDI r2, 27
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
