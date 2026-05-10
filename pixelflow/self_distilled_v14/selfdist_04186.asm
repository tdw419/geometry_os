; DESCRIPTION: Draws a red line from (141, 148) to (284, 183).
; PLAN: r0=141(x1), r1=148(y1), r2=284(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 148
LDI r2, 284
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
