; DESCRIPTION: Draws a black line from (4, 91) to (150, 73).
; PLAN: r0=4(x1), r1=91(y1), r2=150(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 91
LDI r2, 150
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
