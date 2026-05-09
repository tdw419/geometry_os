; DESCRIPTION: Places a blue line segment connecting (173, 171) to (154, 129).
; PLAN: r0=173(x1), r1=171(y1), r2=154(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 171
LDI r2, 154
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
