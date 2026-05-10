; DESCRIPTION: Draws a blue line from (96, 172) to (461, 17).
; PLAN: r0=96(x1), r1=172(y1), r2=461(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 172
LDI r2, 461
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
