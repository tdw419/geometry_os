; DESCRIPTION: Places a white line segment connecting (266, 192) to (291, 135).
; PLAN: r0=266(x1), r1=192(y1), r2=291(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 192
LDI r2, 291
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
