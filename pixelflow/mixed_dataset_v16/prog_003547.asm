; DESCRIPTION: Draws a orange line from (350, 109) to (206, 140).
; PLAN: r0=350(x1), r1=109(y1), r2=206(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 109
LDI r2, 206
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
