; DESCRIPTION: Draws a red line from (157, 208) to (214, 246).
; PLAN: r0=157(x1), r1=208(y1), r2=214(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 208
LDI r2, 214
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
