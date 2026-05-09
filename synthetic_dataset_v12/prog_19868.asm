; DESCRIPTION: Draws a yellow line from (429, 150) to (283, 245).
; PLAN: r0=429(x1), r1=150(y1), r2=283(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 150
LDI r2, 283
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
