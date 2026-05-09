; DESCRIPTION: Places a black line segment connecting (475, 204) to (210, 131).
; PLAN: r0=475(x1), r1=204(y1), r2=210(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 204
LDI r2, 210
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
