; DESCRIPTION: Draws a orange line from (178, 112) to (350, 52).
; PLAN: r0=178(x1), r1=112(y1), r2=350(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 112
LDI r2, 350
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
