; DESCRIPTION: Places a white line segment connecting (16, 147) to (117, 237).
; PLAN: r0=16(x1), r1=147(y1), r2=117(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 147
LDI r2, 117
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
