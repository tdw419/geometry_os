; DESCRIPTION: Draws a orange line from (509, 26) to (340, 207).
; PLAN: r0=509(x1), r1=26(y1), r2=340(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 26
LDI r2, 340
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
