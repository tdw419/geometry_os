; DESCRIPTION: Draws a yellow line from (61, 199) to (130, 81).
; PLAN: r0=61(x1), r1=199(y1), r2=130(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 199
LDI r2, 130
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
