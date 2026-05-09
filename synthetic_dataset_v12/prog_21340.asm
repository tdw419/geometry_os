; DESCRIPTION: Places a black line segment connecting (124, 203) to (182, 64).
; PLAN: r0=124(x1), r1=203(y1), r2=182(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 203
LDI r2, 182
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
