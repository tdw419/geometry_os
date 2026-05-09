; DESCRIPTION: Draws a black line from (17, 99) to (160, 25).
; PLAN: r0=17(x1), r1=99(y1), r2=160(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 99
LDI r2, 160
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
