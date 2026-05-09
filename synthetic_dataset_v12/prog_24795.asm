; DESCRIPTION: Places a yellow line segment connecting (360, 150) to (447, 167).
; PLAN: r0=360(x1), r1=150(y1), r2=447(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 150
LDI r2, 447
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
