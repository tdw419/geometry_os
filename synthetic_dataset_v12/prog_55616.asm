; DESCRIPTION: Places a yellow line segment connecting (461, 113) to (60, 173).
; PLAN: r0=461(x1), r1=113(y1), r2=60(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 113
LDI r2, 60
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
