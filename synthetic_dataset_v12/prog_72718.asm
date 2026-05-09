; DESCRIPTION: Places a white line segment connecting (279, 151) to (447, 247).
; PLAN: r0=279(x1), r1=151(y1), r2=447(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 151
LDI r2, 447
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
