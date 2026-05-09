; DESCRIPTION: Composite: Places a purple dot at position (384, 62) then Renders a cyan disk with center (425, 73) and radius 53.
; PLAN: r0=384(x), r1=62(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=73(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 384
LDI r1, 62
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 73
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
