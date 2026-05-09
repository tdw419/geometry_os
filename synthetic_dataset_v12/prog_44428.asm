; DESCRIPTION: Places a white line segment connecting (12, 16) to (291, 34).
; PLAN: r0=12(x1), r1=16(y1), r2=291(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 16
LDI r2, 291
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
