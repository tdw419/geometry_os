; DESCRIPTION: Draws a orange line from (261, 130) to (438, 28).
; PLAN: r0=261(x1), r1=130(y1), r2=438(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 130
LDI r2, 438
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
