; DESCRIPTION: Draws a blue line from (167, 122) to (75, 39).
; PLAN: r0=167(x1), r1=122(y1), r2=75(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 122
LDI r2, 75
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
