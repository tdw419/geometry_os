; DESCRIPTION: Draws a red line from (109, 189) to (167, 206).
; PLAN: r0=109(x1), r1=189(y1), r2=167(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 189
LDI r2, 167
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
