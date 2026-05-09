; DESCRIPTION: Draws a blue line from (86, 6) to (178, 43).
; PLAN: r0=86(x1), r1=6(y1), r2=178(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 6
LDI r2, 178
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
