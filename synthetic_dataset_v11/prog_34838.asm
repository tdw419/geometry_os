; DESCRIPTION: Draws a black line from (160, 105) to (107, 88).
; PLAN: r0=160(x1), r1=105(y1), r2=107(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 105
LDI r2, 107
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
