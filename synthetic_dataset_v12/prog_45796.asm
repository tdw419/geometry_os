; DESCRIPTION: Places a green line segment connecting (74, 55) to (182, 78).
; PLAN: r0=74(x1), r1=55(y1), r2=182(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 55
LDI r2, 182
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
