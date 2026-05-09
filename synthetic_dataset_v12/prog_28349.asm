; DESCRIPTION: Places a white line segment connecting (383, 209) to (389, 253).
; PLAN: r0=383(x1), r1=209(y1), r2=389(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 209
LDI r2, 389
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
