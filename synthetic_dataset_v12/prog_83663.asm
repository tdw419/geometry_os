; DESCRIPTION: Places a white line segment connecting (395, 25) to (221, 14).
; PLAN: r0=395(x1), r1=25(y1), r2=221(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 25
LDI r2, 221
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
