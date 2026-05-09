; DESCRIPTION: Draws a red line from (19, 96) to (68, 101).
; PLAN: r0=19(x1), r1=96(y1), r2=68(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 96
LDI r2, 68
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
