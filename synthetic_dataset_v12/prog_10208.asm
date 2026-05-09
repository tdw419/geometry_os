; DESCRIPTION: Draws a black line from (200, 91) to (350, 151).
; PLAN: r0=200(x1), r1=91(y1), r2=350(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 91
LDI r2, 350
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
