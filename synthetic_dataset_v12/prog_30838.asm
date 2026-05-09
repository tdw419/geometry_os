; DESCRIPTION: Places a yellow line segment connecting (447, 120) to (113, 173).
; PLAN: r0=447(x1), r1=120(y1), r2=113(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 120
LDI r2, 113
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
