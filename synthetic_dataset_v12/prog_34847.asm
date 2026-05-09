; DESCRIPTION: Places a red line segment connecting (31, 185) to (173, 68).
; PLAN: r0=31(x1), r1=185(y1), r2=173(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 185
LDI r2, 173
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
