; DESCRIPTION: Renders a cyan disk with center (53, 54) and radius 13.
; PLAN: r0=53(x), r1=54(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 54
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
