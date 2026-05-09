; DESCRIPTION: Places a black line segment connecting (108, 23) to (113, 61).
; PLAN: r0=108(x1), r1=23(y1), r2=113(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 23
LDI r2, 113
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
