; DESCRIPTION: Draws a green line from (157, 204) to (167, 169).
; PLAN: r0=157(x1), r1=204(y1), r2=167(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 204
LDI r2, 167
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
