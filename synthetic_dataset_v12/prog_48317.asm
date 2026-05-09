; DESCRIPTION: Places a white line segment connecting (504, 2) to (185, 255).
; PLAN: r0=504(x1), r1=2(y1), r2=185(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 2
LDI r2, 185
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
