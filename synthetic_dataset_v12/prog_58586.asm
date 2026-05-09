; DESCRIPTION: Draws a black line from (17, 91) to (14, 6).
; PLAN: r0=17(x1), r1=91(y1), r2=14(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 91
LDI r2, 14
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
