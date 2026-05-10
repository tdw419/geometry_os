; DESCRIPTION: Draws a yellow line from (28, 183) to (341, 33).
; PLAN: r0=28(x1), r1=183(y1), r2=341(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 183
LDI r2, 341
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
