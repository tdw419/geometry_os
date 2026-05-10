; DESCRIPTION: Renders a cyan disk with center (394, 94) and radius 48.
; PLAN: r0=394(x), r1=94(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 94
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
