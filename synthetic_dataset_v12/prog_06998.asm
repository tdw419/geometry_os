; DESCRIPTION: Draws a blue line from (254, 204) to (9, 227).
; PLAN: r0=254(x1), r1=204(y1), r2=9(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 204
LDI r2, 9
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
