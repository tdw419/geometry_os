; DESCRIPTION: Draws a orange line from (18, 189) to (52, 95).
; PLAN: r0=18(x1), r1=189(y1), r2=52(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 189
LDI r2, 52
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
