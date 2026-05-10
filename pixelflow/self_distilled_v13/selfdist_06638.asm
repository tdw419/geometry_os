; DESCRIPTION: Draws a white vertical line down the screen at x=124.
; PLAN: r0=124(x1), r1=1(y1), r2=0(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 1
LDI r2, 0
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
