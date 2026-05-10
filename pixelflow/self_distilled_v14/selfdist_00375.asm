; DESCRIPTION: Draws a red vertical line down the screen at x=386.
; PLAN: r0=386(x1), r1=10(y1), r2=30(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 10
LDI r2, 30
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
