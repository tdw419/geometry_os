; DESCRIPTION: Renders a black line between points (36, 64) and (203, 69).
; PLAN: r0=36(x1), r1=64(y1), r2=203(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 64
LDI r2, 203
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
