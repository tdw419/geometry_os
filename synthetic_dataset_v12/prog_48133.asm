; DESCRIPTION: Draws a black line from (54, 166) to (116, 34).
; PLAN: r0=54(x1), r1=166(y1), r2=116(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 166
LDI r2, 116
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
