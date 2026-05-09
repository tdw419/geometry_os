; DESCRIPTION: Draws a red line from (194, 63) to (154, 34).
; PLAN: r0=194(x1), r1=63(y1), r2=154(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 63
LDI r2, 154
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
