; DESCRIPTION: Renders a cyan disk with center (280, 177) and radius 39.
; PLAN: r0=280(x), r1=177(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 177
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
