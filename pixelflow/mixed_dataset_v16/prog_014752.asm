; DESCRIPTION: Places a cyan disk with center (285, 130) and radius 75.
; PLAN: r0=285(x), r1=130(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 130
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
