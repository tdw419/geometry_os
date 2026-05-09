; DESCRIPTION: Places a white line segment connecting (29, 62) to (305, 1).
; PLAN: r0=29(x1), r1=62(y1), r2=305(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 62
LDI r2, 305
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
