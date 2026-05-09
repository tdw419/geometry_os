; DESCRIPTION: Draws a green line from (227, 157) to (105, 240).
; PLAN: r0=227(x1), r1=157(y1), r2=105(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 157
LDI r2, 105
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
