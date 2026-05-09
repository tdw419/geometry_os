; DESCRIPTION: Draws a red line from (167, 69) to (204, 83).
; PLAN: r0=167(x1), r1=69(y1), r2=204(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 69
LDI r2, 204
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
