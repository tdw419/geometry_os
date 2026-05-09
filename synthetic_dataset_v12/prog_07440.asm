; DESCRIPTION: Places a green line segment connecting (502, 185) to (476, 102).
; PLAN: r0=502(x1), r1=185(y1), r2=476(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 185
LDI r2, 476
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
