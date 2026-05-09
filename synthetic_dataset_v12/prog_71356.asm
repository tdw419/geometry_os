; DESCRIPTION: Draws a green line from (246, 204) to (116, 0).
; PLAN: r0=246(x1), r1=204(y1), r2=116(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 204
LDI r2, 116
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
