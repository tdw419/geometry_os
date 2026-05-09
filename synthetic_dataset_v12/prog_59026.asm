; DESCRIPTION: Places a white line segment connecting (222, 60) to (256, 153).
; PLAN: r0=222(x1), r1=60(y1), r2=256(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 60
LDI r2, 256
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
