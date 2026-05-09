; DESCRIPTION: Draws a yellow line from (233, 161) to (8, 66).
; PLAN: r0=233(x1), r1=161(y1), r2=8(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 161
LDI r2, 8
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
