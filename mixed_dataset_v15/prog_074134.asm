; DESCRIPTION: Draws a white vertical line down the screen at x=126.
; PLAN: r0=126(x1), r1=1(y1), r2=0(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 1
LDI r2, 0
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
