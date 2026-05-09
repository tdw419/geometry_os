; DESCRIPTION: Draws a orange line from (175, 246) to (362, 191).
; PLAN: r0=175(x1), r1=246(y1), r2=362(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 246
LDI r2, 362
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
