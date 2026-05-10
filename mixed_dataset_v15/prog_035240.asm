; DESCRIPTION: Composite: Places a red dot at position (387, 186) then Places a yellow circle of radius 71 at center (361, 104).
; PLAN: r0=387(x), r1=186(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=361(x), r6=104(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 387
LDI r1, 186
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 361
LDI r6, 104
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
