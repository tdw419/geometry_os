; DESCRIPTION: Places a black line segment connecting (276, 36) to (200, 210).
; PLAN: r0=276(x1), r1=36(y1), r2=200(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 36
LDI r2, 200
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
