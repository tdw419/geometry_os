; DESCRIPTION: Draws a orange line from (284, 2) to (238, 185).
; PLAN: r0=284(x1), r1=2(y1), r2=238(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 2
LDI r2, 238
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
