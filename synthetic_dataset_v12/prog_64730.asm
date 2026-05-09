; DESCRIPTION: Draws a orange line from (222, 140) to (466, 209).
; PLAN: r0=222(x1), r1=140(y1), r2=466(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 140
LDI r2, 466
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
