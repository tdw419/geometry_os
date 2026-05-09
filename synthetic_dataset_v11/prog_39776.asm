; DESCRIPTION: Draws a red line from (194, 225) to (28, 184).
; PLAN: r0=194(x1), r1=225(y1), r2=28(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 225
LDI r2, 28
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
