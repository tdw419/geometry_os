; DESCRIPTION: Places a white line segment connecting (289, 97) to (481, 64).
; PLAN: r0=289(x1), r1=97(y1), r2=481(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 97
LDI r2, 481
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
