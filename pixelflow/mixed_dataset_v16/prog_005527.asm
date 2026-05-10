; DESCRIPTION: Draws a red line from (183, 151) to (31, 243).
; PLAN: r0=183(x1), r1=151(y1), r2=31(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 151
LDI r2, 31
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
