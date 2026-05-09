; DESCRIPTION: Draws a red line from (253, 73) to (35, 184).
; PLAN: r0=253(x1), r1=73(y1), r2=35(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 73
LDI r2, 35
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
