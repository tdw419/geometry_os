; DESCRIPTION: Places a white line segment connecting (294, 121) to (92, 22).
; PLAN: r0=294(x1), r1=121(y1), r2=92(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 121
LDI r2, 92
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
