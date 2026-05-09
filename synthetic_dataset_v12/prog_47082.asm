; DESCRIPTION: Composite: Sets a single yellow pixel at (121, 214) then Places a red circle of radius 57 at center (58, 88).
; PLAN: r0=121(x), r1=214(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=58(x), r6=88(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 121
LDI r1, 214
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 58
LDI r6, 88
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
