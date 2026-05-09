; DESCRIPTION: Draws a orange line from (346, 232) to (354, 181).
; PLAN: r0=346(x1), r1=232(y1), r2=354(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 232
LDI r2, 354
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
