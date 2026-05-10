; DESCRIPTION: Composite: Places a black circle of radius 22 at center (172, 143) then Places a green dot at position (49, 182).
; PLAN: r0=172(x), r1=143(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=182(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 143
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 182
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
