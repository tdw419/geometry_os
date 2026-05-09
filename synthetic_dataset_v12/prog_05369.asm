; DESCRIPTION: Composite: Places a black dot at position (401, 182) then Draws a green circle centered at (228, 80) with radius 25.
; PLAN: r0=401(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=80(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 228
LDI r6, 80
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
