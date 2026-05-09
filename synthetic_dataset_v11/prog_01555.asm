; DESCRIPTION: Draws a yellow line from (157, 10) to (40, 60).
; PLAN: r0=157(x1), r1=10(y1), r2=40(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 10
LDI r2, 40
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
