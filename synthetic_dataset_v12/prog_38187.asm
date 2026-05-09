; DESCRIPTION: Draws a orange line from (391, 25) to (38, 95).
; PLAN: r0=391(x1), r1=25(y1), r2=38(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 25
LDI r2, 38
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
