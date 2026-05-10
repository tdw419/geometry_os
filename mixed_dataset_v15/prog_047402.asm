; DESCRIPTION: Composite: Places a magenta dot at position (500, 246) then Places a cyan circle of radius 46 at center (87, 73).
; PLAN: r0=500(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=73(y), r7=46(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 500
LDI r1, 246
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 73
LDI r7, 46
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
