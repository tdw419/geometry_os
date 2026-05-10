; DESCRIPTION: Renders a cyan circular shape at (107, 140) with radius 51.
; PLAN: r0=107(x), r1=140(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 140
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
