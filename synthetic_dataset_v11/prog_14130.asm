; DESCRIPTION: Draws a yellow line from (40, 192) to (109, 177).
; PLAN: r0=40(x1), r1=192(y1), r2=109(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 192
LDI r2, 109
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
