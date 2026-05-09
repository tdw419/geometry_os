; DESCRIPTION: Places a red line segment connecting (228, 35) to (285, 167).
; PLAN: r0=228(x1), r1=35(y1), r2=285(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 35
LDI r2, 285
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
