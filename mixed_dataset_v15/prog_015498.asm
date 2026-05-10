; DESCRIPTION: Draws a yellow line from (268, 169) to (33, 204).
; PLAN: r0=268(x1), r1=169(y1), r2=33(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 169
LDI r2, 33
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
