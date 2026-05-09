; DESCRIPTION: Draws a orange line from (237, 56) to (197, 247).
; PLAN: r0=237(x1), r1=56(y1), r2=197(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 56
LDI r2, 197
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
