; DESCRIPTION: Renders a cyan disk with center (107, 167) and radius 74.
; PLAN: r0=107(x), r1=167(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 167
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
