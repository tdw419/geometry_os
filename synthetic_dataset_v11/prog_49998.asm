; DESCRIPTION: Draws a blue line from (138, 138) to (157, 199).
; PLAN: r0=138(x1), r1=138(y1), r2=157(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 138
LDI r2, 157
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
