; DESCRIPTION: Draws a white vertical line down the screen at x=354.
; PLAN: r0=244(x1), r1=10(y1), r2=3(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 10
LDI r2, 3
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
