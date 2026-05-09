; DESCRIPTION: Draws a black line from (43, 95) to (106, 13).
; PLAN: r0=43(x1), r1=95(y1), r2=106(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 95
LDI r2, 106
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
