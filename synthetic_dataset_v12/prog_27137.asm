; DESCRIPTION: Places a black line segment connecting (256, 130) to (456, 77).
; PLAN: r0=256(x1), r1=130(y1), r2=456(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 130
LDI r2, 456
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
