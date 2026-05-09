; DESCRIPTION: Draws a white line from (306, 95) to (150, 122).
; PLAN: r0=306(x1), r1=95(y1), r2=150(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 95
LDI r2, 150
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
