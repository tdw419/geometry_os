; DESCRIPTION: Places a green line segment connecting (173, 246) to (237, 70).
; PLAN: r0=173(x1), r1=246(y1), r2=237(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 246
LDI r2, 237
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
