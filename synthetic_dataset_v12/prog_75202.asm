; DESCRIPTION: Composite: Places a magenta circle of radius 39 at center (303, 47) then Places a white dot at position (384, 121).
; PLAN: r0=303(x), r1=47(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=121(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 47
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 121
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
