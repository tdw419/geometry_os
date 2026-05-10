; DESCRIPTION: Draws a blue line from (372, 172) to (138, 105).
; PLAN: r0=372(x1), r1=172(y1), r2=138(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 172
LDI r2, 138
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
