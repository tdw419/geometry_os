; DESCRIPTION: Places a white line segment connecting (135, 30) to (233, 33).
; PLAN: r0=135(x1), r1=30(y1), r2=233(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 30
LDI r2, 233
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
