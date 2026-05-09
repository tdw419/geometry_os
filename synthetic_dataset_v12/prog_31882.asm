; DESCRIPTION: Places a blue circle of radius 77 at center (432, 151).
; PLAN: r0=432(x), r1=151(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 151
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
