; DESCRIPTION: Draws a black line from (49, 46) to (204, 1).
; PLAN: r0=49(x1), r1=46(y1), r2=204(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 46
LDI r2, 204
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
