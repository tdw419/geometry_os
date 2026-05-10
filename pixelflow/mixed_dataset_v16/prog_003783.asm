; DESCRIPTION: Draws a orange line from (126, 251) to (496, 221).
; PLAN: r0=126(x1), r1=251(y1), r2=496(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 251
LDI r2, 496
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
