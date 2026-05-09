; DESCRIPTION: Renders a black disk with center (366, 150) and radius 57.
; PLAN: r0=366(x), r1=150(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 150
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
