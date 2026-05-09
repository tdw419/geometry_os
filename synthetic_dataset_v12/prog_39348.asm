; DESCRIPTION: Renders a cyan disk with center (206, 182) and radius 43.
; PLAN: r0=206(x), r1=182(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 182
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
