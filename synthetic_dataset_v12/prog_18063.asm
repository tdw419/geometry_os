; DESCRIPTION: Composite: Places a green dot at position (63, 204) then Places a black circle of radius 28 at center (469, 112).
; PLAN: r0=63(x), r1=204(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=469(x), r6=112(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 204
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 469
LDI r6, 112
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
