; DESCRIPTION: Renders a cyan disk with center (265, 213) and radius 31.
; PLAN: r0=265(x), r1=213(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 213
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
