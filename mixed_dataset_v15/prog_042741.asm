; DESCRIPTION: Places a white line segment connecting (328, 133) to (102, 224).
; PLAN: r0=328(x1), r1=133(y1), r2=102(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 133
LDI r2, 102
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
