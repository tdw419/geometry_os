; DESCRIPTION: Composite: Creates a red circular shape at (166, 112) with radius 35 then Places a magenta dot at position (336, 51).
; PLAN: r0=166(x), r1=112(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x), r6=51(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 112
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 51
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
