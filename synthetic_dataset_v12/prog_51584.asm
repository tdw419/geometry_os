; DESCRIPTION: Draws a black line from (409, 99) to (22, 73).
; PLAN: r0=409(x1), r1=99(y1), r2=22(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 99
LDI r2, 22
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
