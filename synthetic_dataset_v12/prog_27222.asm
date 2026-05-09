; DESCRIPTION: Places a green line segment connecting (506, 174) to (476, 197).
; PLAN: r0=506(x1), r1=174(y1), r2=476(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 174
LDI r2, 476
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
