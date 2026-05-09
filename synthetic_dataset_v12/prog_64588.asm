; DESCRIPTION: Draws a yellow line from (382, 139) to (191, 137).
; PLAN: r0=382(x1), r1=139(y1), r2=191(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 139
LDI r2, 191
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
