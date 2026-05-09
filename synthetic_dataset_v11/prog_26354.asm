; DESCRIPTION: Places a red line segment connecting (114, 253) to (238, 206).
; PLAN: r0=114(x1), r1=253(y1), r2=238(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 253
LDI r2, 238
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
