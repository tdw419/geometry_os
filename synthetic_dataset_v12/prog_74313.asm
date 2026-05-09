; DESCRIPTION: Places a black line segment connecting (441, 184) to (228, 240).
; PLAN: r0=441(x1), r1=184(y1), r2=228(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 184
LDI r2, 228
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
