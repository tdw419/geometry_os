; DESCRIPTION: Draws a red line from (183, 44) to (274, 15).
; PLAN: r0=183(x1), r1=44(y1), r2=274(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 44
LDI r2, 274
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
