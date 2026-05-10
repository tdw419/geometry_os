; DESCRIPTION: Draws a orange line from (437, 183) to (220, 153).
; PLAN: r0=437(x1), r1=183(y1), r2=220(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 183
LDI r2, 220
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
