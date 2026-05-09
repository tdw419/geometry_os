; DESCRIPTION: Places a white line segment connecting (52, 160) to (182, 38).
; PLAN: r0=52(x1), r1=160(y1), r2=182(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 160
LDI r2, 182
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
