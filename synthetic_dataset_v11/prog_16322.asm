; DESCRIPTION: Renders a cyan disk with center (168, 163) and radius 23.
; PLAN: r0=168(x), r1=163(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 163
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
