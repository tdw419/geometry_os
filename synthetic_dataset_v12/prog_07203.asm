; DESCRIPTION: Draws a white line from (341, 88) to (292, 144).
; PLAN: r0=341(x1), r1=88(y1), r2=292(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 88
LDI r2, 292
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
