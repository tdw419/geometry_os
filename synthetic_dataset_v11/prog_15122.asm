; DESCRIPTION: Renders a cyan disk with center (137, 86) and radius 32.
; PLAN: r0=137(x), r1=86(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 86
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
