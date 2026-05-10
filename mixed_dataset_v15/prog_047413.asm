; DESCRIPTION: Renders a cyan disk with center (107, 119) and radius 63.
; PLAN: r0=107(x), r1=119(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 119
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
