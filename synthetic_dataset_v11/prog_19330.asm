; DESCRIPTION: Places a red line segment connecting (157, 249) to (25, 69).
; PLAN: r0=157(x1), r1=249(y1), r2=25(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 249
LDI r2, 25
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
