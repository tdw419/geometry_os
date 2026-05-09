; DESCRIPTION: Places a yellow line segment connecting (173, 238) to (123, 94).
; PLAN: r0=173(x1), r1=238(y1), r2=123(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 238
LDI r2, 123
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
