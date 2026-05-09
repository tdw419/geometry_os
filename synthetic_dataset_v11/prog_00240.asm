; DESCRIPTION: Draws a blue line from (27, 142) to (244, 123).
; PLAN: r0=27(x1), r1=142(y1), r2=244(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 142
LDI r2, 244
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
