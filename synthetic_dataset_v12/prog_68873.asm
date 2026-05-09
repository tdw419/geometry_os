; DESCRIPTION: Places a red line segment connecting (11, 246) to (173, 162).
; PLAN: r0=11(x1), r1=246(y1), r2=173(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 246
LDI r2, 173
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
