; DESCRIPTION: Draws a red vertical line down the screen at x=351.
; PLAN: r0=351(x1), r1=10(y1), r2=35(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 10
LDI r2, 35
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
