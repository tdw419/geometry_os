; DESCRIPTION: Places a red line segment connecting (21, 157) to (35, 173).
; PLAN: r0=21(x1), r1=157(y1), r2=35(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 157
LDI r2, 35
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
