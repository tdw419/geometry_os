; DESCRIPTION: Draws a orange line from (49, 107) to (95, 134).
; PLAN: r0=49(x1), r1=107(y1), r2=95(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 107
LDI r2, 95
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
