; DESCRIPTION: Places a white line segment connecting (8, 127) to (188, 92).
; PLAN: r0=8(x1), r1=127(y1), r2=188(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 127
LDI r2, 188
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
