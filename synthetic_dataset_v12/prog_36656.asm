; DESCRIPTION: Draws a yellow line from (294, 118) to (204, 109).
; PLAN: r0=294(x1), r1=118(y1), r2=204(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 118
LDI r2, 204
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
