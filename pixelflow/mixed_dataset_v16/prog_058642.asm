; DESCRIPTION: Places a white line segment connecting (313, 25) to (228, 36).
; PLAN: r0=313(x1), r1=25(y1), r2=228(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 25
LDI r2, 228
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
