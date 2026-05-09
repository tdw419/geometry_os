; DESCRIPTION: Places a white line segment connecting (349, 136) to (173, 108).
; PLAN: r0=349(x1), r1=136(y1), r2=173(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 136
LDI r2, 173
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
