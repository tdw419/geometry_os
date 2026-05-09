; DESCRIPTION: Draws a blue line from (227, 38) to (178, 12).
; PLAN: r0=227(x1), r1=38(y1), r2=178(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 38
LDI r2, 178
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
