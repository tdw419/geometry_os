; DESCRIPTION: Draws a white line from (8, 176) to (227, 212).
; PLAN: r0=8(x1), r1=176(y1), r2=227(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 176
LDI r2, 227
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
