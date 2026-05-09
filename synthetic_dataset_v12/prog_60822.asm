; DESCRIPTION: Draws a blue line from (167, 149) to (316, 140).
; PLAN: r0=167(x1), r1=149(y1), r2=316(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 149
LDI r2, 316
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
