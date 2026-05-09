; DESCRIPTION: Draws a green line from (73, 137) to (159, 53).
; PLAN: r0=73(x1), r1=137(y1), r2=159(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 137
LDI r2, 159
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
