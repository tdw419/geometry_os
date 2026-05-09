; DESCRIPTION: Draws a orange line from (247, 103) to (407, 108).
; PLAN: r0=247(x1), r1=103(y1), r2=407(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 103
LDI r2, 407
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
