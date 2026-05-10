; DESCRIPTION: Draws a blue line from (19, 175) to (167, 13).
; PLAN: r0=19(x1), r1=175(y1), r2=167(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 175
LDI r2, 167
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
