; DESCRIPTION: Renders a cyan disk with center (286, 126) and radius 63.
; PLAN: r0=286(x), r1=126(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 126
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
