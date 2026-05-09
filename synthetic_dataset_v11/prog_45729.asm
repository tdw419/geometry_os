; DESCRIPTION: Draws a black line from (34, 135) to (76, 222).
; PLAN: r0=34(x1), r1=135(y1), r2=76(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 135
LDI r2, 76
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
