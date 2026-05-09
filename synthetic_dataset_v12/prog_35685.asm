; DESCRIPTION: Renders a cyan disk with center (394, 183) and radius 63.
; PLAN: r0=394(x), r1=183(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 183
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
