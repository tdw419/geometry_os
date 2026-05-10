; DESCRIPTION: Draws a red vertical line down the screen at x=148.
; PLAN: r0=148(x1), r1=10(y1), r2=0(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 10
LDI r2, 0
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
