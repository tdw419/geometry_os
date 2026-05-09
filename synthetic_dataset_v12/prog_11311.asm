; DESCRIPTION: Places a black line segment connecting (113, 102) to (247, 61).
; PLAN: r0=113(x1), r1=102(y1), r2=247(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 102
LDI r2, 247
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
