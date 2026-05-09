; DESCRIPTION: Places a black line segment connecting (11, 203) to (460, 193).
; PLAN: r0=11(x1), r1=203(y1), r2=460(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 203
LDI r2, 460
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
