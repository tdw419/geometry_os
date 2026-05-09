; DESCRIPTION: Draws a yellow line from (192, 134) to (341, 124).
; PLAN: r0=192(x1), r1=134(y1), r2=341(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 134
LDI r2, 341
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
