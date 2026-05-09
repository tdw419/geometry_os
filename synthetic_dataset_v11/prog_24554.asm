; DESCRIPTION: Places a red line segment connecting (173, 248) to (161, 204).
; PLAN: r0=173(x1), r1=248(y1), r2=161(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 248
LDI r2, 161
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
