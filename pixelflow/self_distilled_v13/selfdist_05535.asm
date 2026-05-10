; DESCRIPTION: Draws a red vertical line down the screen at x=396.
; PLAN: r0=396(x1), r1=10(y1), r2=9(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 10
LDI r2, 9
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
