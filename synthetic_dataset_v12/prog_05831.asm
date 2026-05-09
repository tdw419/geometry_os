; DESCRIPTION: Draws a blue line from (381, 174) to (214, 76).
; PLAN: r0=381(x1), r1=174(y1), r2=214(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 174
LDI r2, 214
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
