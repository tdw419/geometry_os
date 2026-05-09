; DESCRIPTION: Places a white line segment connecting (183, 12) to (182, 38).
; PLAN: r0=183(x1), r1=12(y1), r2=182(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 12
LDI r2, 182
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
