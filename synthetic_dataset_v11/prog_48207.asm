; DESCRIPTION: Draws a black line from (110, 1) to (68, 46).
; PLAN: r0=110(x1), r1=1(y1), r2=68(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 1
LDI r2, 68
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
