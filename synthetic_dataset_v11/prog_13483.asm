; DESCRIPTION: Renders a cyan disk with center (140, 158) and radius 63.
; PLAN: r0=140(x), r1=158(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 158
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
