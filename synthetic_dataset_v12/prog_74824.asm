; DESCRIPTION: Places a yellow line segment connecting (357, 121) to (299, 173).
; PLAN: r0=357(x1), r1=121(y1), r2=299(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 121
LDI r2, 299
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
