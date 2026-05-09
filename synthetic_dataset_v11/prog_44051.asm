; DESCRIPTION: Draws a red line from (43, 36) to (189, 206).
; PLAN: r0=43(x1), r1=36(y1), r2=189(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 36
LDI r2, 189
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
