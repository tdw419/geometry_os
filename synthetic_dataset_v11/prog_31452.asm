; DESCRIPTION: Draws a red line from (194, 165) to (211, 239).
; PLAN: r0=194(x1), r1=165(y1), r2=211(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 165
LDI r2, 211
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
