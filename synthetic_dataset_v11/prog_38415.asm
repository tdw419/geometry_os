; DESCRIPTION: Draws a green line from (118, 141) to (183, 109).
; PLAN: r0=118(x1), r1=141(y1), r2=183(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 141
LDI r2, 183
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
