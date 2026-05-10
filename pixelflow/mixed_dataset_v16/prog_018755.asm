; DESCRIPTION: Draws a red vertical line down the screen at x=178.
; PLAN: r0=178(x1), r1=15(y1), r2=0(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 15
LDI r2, 0
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
