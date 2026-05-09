; DESCRIPTION: Places a green line segment connecting (173, 15) to (241, 194).
; PLAN: r0=173(x1), r1=15(y1), r2=241(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 15
LDI r2, 241
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
