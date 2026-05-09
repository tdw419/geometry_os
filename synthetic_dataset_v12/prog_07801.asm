; DESCRIPTION: Draws a blue line from (407, 188) to (488, 227).
; PLAN: r0=407(x1), r1=188(y1), r2=488(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 188
LDI r2, 488
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
