; DESCRIPTION: Places a black line segment connecting (19, 208) to (200, 57).
; PLAN: r0=19(x1), r1=208(y1), r2=200(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 208
LDI r2, 200
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
