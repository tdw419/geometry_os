; DESCRIPTION: Places a white line segment connecting (214, 180) to (141, 230).
; PLAN: r0=214(x1), r1=180(y1), r2=141(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 180
LDI r2, 141
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
