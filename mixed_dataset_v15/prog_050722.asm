; DESCRIPTION: Places a black line segment connecting (460, 37) to (338, 115).
; PLAN: r0=460(x1), r1=37(y1), r2=338(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 37
LDI r2, 338
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
