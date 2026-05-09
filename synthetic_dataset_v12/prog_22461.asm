; DESCRIPTION: Draws a yellow line from (380, 73) to (157, 10).
; PLAN: r0=380(x1), r1=73(y1), r2=157(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 73
LDI r2, 157
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
