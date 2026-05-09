; DESCRIPTION: Renders a yellow line between points (183, 118) and (174, 182).
; PLAN: r0=183(x1), r1=118(y1), r2=174(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 118
LDI r2, 174
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
