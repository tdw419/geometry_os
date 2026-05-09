; DESCRIPTION: Draws a orange line from (103, 238) to (240, 133).
; PLAN: r0=103(x1), r1=238(y1), r2=240(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 238
LDI r2, 240
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
