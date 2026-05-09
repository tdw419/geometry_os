; DESCRIPTION: Draws a white line from (246, 76) to (129, 132).
; PLAN: r0=246(x1), r1=76(y1), r2=129(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 76
LDI r2, 129
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
