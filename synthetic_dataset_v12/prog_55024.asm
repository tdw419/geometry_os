; DESCRIPTION: Draws a black line from (490, 204) to (134, 239).
; PLAN: r0=490(x1), r1=204(y1), r2=134(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 204
LDI r2, 134
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
