; DESCRIPTION: Draws a yellow line from (140, 244) to (102, 28).
; PLAN: r0=140(x1), r1=244(y1), r2=102(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 244
LDI r2, 102
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
