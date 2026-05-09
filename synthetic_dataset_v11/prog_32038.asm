; DESCRIPTION: Places a red line segment connecting (181, 119) to (173, 240).
; PLAN: r0=181(x1), r1=119(y1), r2=173(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 119
LDI r2, 173
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
