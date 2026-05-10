; DESCRIPTION: Draws a red vertical line down the screen at x=118.
; PLAN: r0=118(x1), r1=10(y1), r2=0(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 10
LDI r2, 0
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
