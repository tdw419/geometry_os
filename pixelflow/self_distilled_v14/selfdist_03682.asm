; DESCRIPTION: Places a cyan disk with center (29, 130) and radius 10.
; PLAN: r0=29(x), r1=130(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 130
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
