; DESCRIPTION: Draws a orange line from (354, 140) to (50, 214).
; PLAN: r0=354(x1), r1=140(y1), r2=50(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 140
LDI r2, 50
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
