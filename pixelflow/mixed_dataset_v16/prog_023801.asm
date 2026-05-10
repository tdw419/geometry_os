; DESCRIPTION: Draws a orange line from (120, 122) to (265, 240).
; PLAN: r0=120(x1), r1=122(y1), r2=265(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 122
LDI r2, 265
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
