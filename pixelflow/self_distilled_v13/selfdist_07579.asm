; DESCRIPTION: Draws a red vertical line down the screen at x=387.
; PLAN: r0=387(x1), r1=10(y1), r2=38(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 10
LDI r2, 38
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
