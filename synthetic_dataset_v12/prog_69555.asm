; DESCRIPTION: Renders a cyan disk with center (341, 188) and radius 68.
; PLAN: r0=341(x), r1=188(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 188
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
