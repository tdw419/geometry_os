; DESCRIPTION: Renders a black disk with center (187, 111) and radius 48.
; PLAN: r0=187(x), r1=111(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 111
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
