; DESCRIPTION: Renders a cyan disk with center (366, 113) and radius 73.
; PLAN: r0=366(x), r1=113(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 113
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
