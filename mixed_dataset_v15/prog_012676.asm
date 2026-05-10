; DESCRIPTION: Composite: Places a magenta dot at position (315, 116) then Places a yellow circle of radius 49 at center (157, 178).
; PLAN: r0=315(x), r1=116(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=157(x), r6=178(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 116
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 178
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
