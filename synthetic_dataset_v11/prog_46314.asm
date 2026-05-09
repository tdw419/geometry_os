; DESCRIPTION: Places a white line segment connecting (120, 156) to (202, 92).
; PLAN: r0=120(x1), r1=156(y1), r2=202(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 156
LDI r2, 202
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
