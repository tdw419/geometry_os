; DESCRIPTION: Places a black line segment connecting (426, 73) to (384, 40).
; PLAN: r0=426(x1), r1=73(y1), r2=384(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 73
LDI r2, 384
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
