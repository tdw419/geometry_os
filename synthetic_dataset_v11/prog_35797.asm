; DESCRIPTION: Draws a red line from (29, 250) to (183, 165).
; PLAN: r0=29(x1), r1=250(y1), r2=183(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 250
LDI r2, 183
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
