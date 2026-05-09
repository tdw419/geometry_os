; DESCRIPTION: Places a white line segment connecting (158, 152) to (53, 38).
; PLAN: r0=158(x1), r1=152(y1), r2=53(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 152
LDI r2, 53
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
