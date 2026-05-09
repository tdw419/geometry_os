; DESCRIPTION: Draws a black line from (17, 200) to (113, 40).
; PLAN: r0=17(x1), r1=200(y1), r2=113(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 200
LDI r2, 113
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
