; DESCRIPTION: Draws a orange line from (302, 187) to (425, 95).
; PLAN: r0=302(x1), r1=187(y1), r2=425(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 187
LDI r2, 425
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
