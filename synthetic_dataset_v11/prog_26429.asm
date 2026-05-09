; DESCRIPTION: Places a green line segment connecting (22, 141) to (173, 145).
; PLAN: r0=22(x1), r1=141(y1), r2=173(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 141
LDI r2, 173
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
