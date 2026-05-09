; DESCRIPTION: Places a black line segment connecting (475, 184) to (354, 61).
; PLAN: r0=475(x1), r1=184(y1), r2=354(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 184
LDI r2, 354
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
