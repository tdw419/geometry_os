; DESCRIPTION: Places a white line segment connecting (228, 100) to (54, 1).
; PLAN: r0=228(x1), r1=100(y1), r2=54(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 100
LDI r2, 54
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
